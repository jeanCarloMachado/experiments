module IO where
    tryIo = do putStr "Enter your name: ";
               line <- getLine ;
               let { backwards = reverse line }
               return ("Hello: " ++ backwards)
