(from-consensus-buff? int 0x0000000000000000000000000000000001) ;; Returns (some 1)
(from-consensus-buff? uint 0x0000000000000000000000000000000001) ;; Returns none 
(from-consensus-buff? uint 0x0100000000000000000000000000000001) ;; Returns (some u1)
(from-consensus-buff? bool 0x0000000000000000000000000000000001) ;; Returns none
(from-consensus-buff? bool 0x03) ;; Returns (some true)
(from-consensus-buff? bool 0x04) ;; Returns (some false)
(from-consensus-buff? principal 0x051fa46ff88886c2ef9762d970b4d2c63678835bd39d) ;; Returns (some SZ2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKQ9H6DPR)
(from-consensus-buff? { abc: int, def: int } 0x0c00000002036162630000000000000000000000000000000003036465660000000000000000000000000000000004) ;; Returns (some (tuple (abc 3) (def 4)))