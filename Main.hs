module Main where

import Tree
import Data.Monoid

main :: IO ()
main = do
  let t1 = Node (Node (Leaf 1) 2 (Leaf 3)) 4 (Node (Leaf 5) 6 (Leaf 7))

  putStrLn "\n============ ascii art de t1 ============"
  putStrLn "                    4"                   
  putStrLn "                  /   \\"                
  putStrLn "                 2     6"                
  putStrLn "                / \\   / \\"            
  putStrLn "               1   3 5   7"             
  putStrLn "========================================="

  putStrLn "\nt1: aplicando to_list em t1 -------------"
  putStrLn $ show (to_list t1)

  putStrLn "\nt1: testando elemento 7 -----------------"
  if contains t1 7
    then print     "FOUND"
    else print "NOT FOUND"

  putStrLn "\nt1: testando elemento 9 -----------------"
  if contains t1 9
    then print     "FOUND"
    else print "NOT FOUND"

  let t2 = add_node t1 8
  putStrLn "\nt2: acrescentando 8 no t1 ---------------"
  putStrLn $ show (to_list t2)

  let t3 = fmap (+10) t2
  putStrLn "\nt3: somando +10 em todos t2 -------------"
  putStrLn $ show (to_list t3)

  putStrLn "\ncomparando t1 e t2: ---------------------"
  if t1 == t2
    then print "EQUAL"
    else print "DIFF."

  let ct1 = t1
  putStrLn "\ncomparando copia de t1 e t1: ------------"
  if t1 == ct1
    then print "EQUAL"
    else print "DIFF."

  let t4 = merge_tree t2 t3
  putStrLn "\nt4: merge de t2 e t3   (TODO) -----------"
  putStrLn $ show (to_list t4)

  putStrLn "\nt5: removendo 16 de t4 (TODO) -----------"
  let t5 = remove_node t4 16
  putStrLn $ show (to_list t5)

  let t6 = t1
  putStrLn "\ntestando reduces no t1 ------------------"
  putStrLn $ show $ foldMap (Any . even) t6
  putStrLn $ show $ foldMap Sum t6
