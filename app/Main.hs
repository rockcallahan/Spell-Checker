module Main where

import Lib
import System.IO.Strict as I 
import BKTree as B

tol = 1

ask:: B.BKTree String-> IO() 
ask tree =  do 
    print "Enter Word:"
    wrd <- getLine
    print $ take 20 $ map fst $ B.query tol wrd tree
    ask tree

main :: IO ()
main = do
    df<- I.readFile "words.txt"
    let w=lines df
        tree = foldr B.insert B.emptyTree w
    ask tree
    return()