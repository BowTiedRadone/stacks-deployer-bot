import * as dotenv from "dotenv";
import { promises as fs } from "fs";
import { StacksTestnet } from "@stacks/network";
import {
  TransactionVersion,
  getAddressFromPrivateKey,
  getNonce,
  broadcastTransaction,
  makeContractDeploy,
  ClarityVersion,
} from "@stacks/transactions";
import { generateWallet } from "@stacks/wallet-sdk";

dotenv.config();

const apiUrl = process.env.API_URL;
const network = new StacksTestnet({ url: apiUrl });

const mnemo = process.env.MNEMONIC;
const frequency = process.env.FREQUENCY
  ? parseInt(process.env.FREQUENCY)
  : 60000;

const welcomeLog = () => {
  console.log("\nReady to deploy. Environment:\n");
  console.log("Api:", apiUrl);
  console.log("Mnemonic:", mnemo);
  console.log(`Frequency: ${frequency}ms`, "\n");
};

async function getContractFiles() {
  const directory = "./contracts";
  const files = await fs.readdir(directory);

  const clarFiles = files.filter((file) => file.endsWith(".clar"));

  if (clarFiles.length === 0) {
    throw new Error("No .clar files found in the contracts directory");
  }

  return clarFiles.map((file) => ({
    filePath: `${directory}/${file}`,
    contractName: file.replace(".clar", ""),
  }));
}

async function logError(message: string) {
  const errorLog = "./logs/error.log";
  const timestamp = new Date().toISOString();
  await fs.appendFile(errorLog, `${timestamp} - ${message}\n`);
}

async function logDeployment(contractName: string, txId: string) {
  const deploymentsLog = "./logs/deployments.log";
  const timestamp = new Date().toISOString();
  await fs.appendFile(
    deploymentsLog,
    `${timestamp} - ${contractName} deployed with transaction ID: ${txId}\n`
  );
}

async function deployContract(
  filePath: string,
  contractName: string,
  account: any
) {
  try {
    const counterContract = await fs.readFile(filePath, "utf8");
    const tx = await makeContractDeploy({
      network,
      contractName: contractName,
      codeBody: counterContract,
      senderKey: account.privKey,
      clarityVersion: 3 as ClarityVersion,
      nonce: account.nonce,
      fee: 3000,
      anchorMode: "any",
    });

    const broadcastTx = await broadcastTransaction(tx, network);
    console.log(
      "--------------------------------------------------------------------------"
    );
    console.log(`Contract ${contractName} deployed successfully!`);
    console.log("Nonce:", account.nonce);
    console.log("Fee:", tx.auth.spendingCondition.fee.toString());
    console.log("Transaction:", broadcastTx);
    console.log(
      "--------------------------------------------------------------------------"
    );

    await logDeployment(contractName, broadcastTx.txid);
  } catch (error: any) {
    console.log(`Error deploying contract ${contractName}`, error);
    await logError(
      `Error deploying contract ${contractName}: ${error.message}`
    );
  }
}

async function main() {
  try {
    if (!mnemo) {
      throw new Error("Mnemonic not defined in environment variables");
    }
    if (!apiUrl) {
      throw new Error("API_URL not defined in environment variables");
    }

    welcomeLog();

    const wallet = await generateWallet({
      secretKey: mnemo,
      password: "123456",
    });
    const privKey = wallet.accounts[0].stxPrivateKey;

    const account = {
      privKey: privKey,
      stxAddress: getAddressFromPrivateKey(privKey, TransactionVersion.Testnet),
      nonce: Number(
        await getNonce(
          getAddressFromPrivateKey(privKey, TransactionVersion.Testnet),
          network
        )
      ),
    };

    const contractFiles = await getContractFiles();
    const randomIndex = Math.floor(Math.random() * contractFiles.length);
    const { filePath, contractName } = contractFiles[randomIndex];
    const deploymentName = `${contractName}-${Date.now()}`;

    await deployContract(filePath, deploymentName, account);

    console.log(
      `Waiting for ${frequency / 1000}s before deploying the next contract...`
    );
    await new Promise((resolve) => setTimeout(resolve, frequency));
  } catch (error: any) {
    console.error("Error running the deployment script:", error);
    await logError(`Error running the deployment script: ${error.message}`);
  }
}

main().catch((error) => {
  console.error("Unhandled error:", error);
  logError(`Unhandled error: ${error.message}`);
});
