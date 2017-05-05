double :: Int -> Int
double x = x + x

main :: IO ()
main = print (show (double 6))
