//contract SocialNetwork
    (set connections)
    (set posts)
    
    (User 
      (string username;
      (string accountWallet;
      ok))
    
    (User u)
    
    (setUsername(string memory value) 
      (begin
        (var set u.username 
        (ok = value))))
    
    (setAccountWallet(string memory value) 
      (begin
        (var set u.accountWallet 
        (ok = value))))
    
    (setConnections(string memory value)
      (connections.push(0xE6715b4Ff8cd51bb925213f066E87EC228966EC3
      ok)))
    
    (setPosts(uint256 value)
        (posts.push("Test post string ONE"
        (posts.push("Test post string TWO"
        (posts.push("Test post string THREE"
        ok)))))))
    
  