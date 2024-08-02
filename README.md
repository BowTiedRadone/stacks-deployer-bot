# Clarity Smart Contracts Deployer Bot

## Running the bot

### Clone the repository

```bash
git clone https://github.com/BowTiedRadone/stacks-deployer-bot
cd stacks-deployer-bot
```

### Create logs directory

```bash
mkdir logs
```

### Install the dependencies

```bash
npm install
```

### Customize the bot

Create `.env` and copy `.env.example` to the newly created `.env`.

```bash
touch .env && cp .env.example .env
```

Add the `StacksTestnet` api url and the desired wallet's mnemonic to the `.env` file.

### Make the main script executable

```bash
chmod +x ./deployer_go_round.sh
```

### Run the bot

```bash
./deployer_go_round.sh
```
