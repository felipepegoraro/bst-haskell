module Tree where

data Tree x = Leaf x | Node (Tree x) x (Tree x) | Void
  deriving (Show)

-- iterate
instance Functor Tree where
  fmap f Void         = Void
  fmap f (Leaf x)     = Leaf (f x)
  fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r)

-- compare
instance (Eq a) => Eq (Tree a) where 
  Leaf x          == Leaf y           = x == y 
  (Node l1 x1 r1) == (Node l2 x2 r2)  = l1 == l2 && x1 == x2 && r1 == r2
  _               == _                = False

-- reduce
instance Foldable Tree where
  foldMap f (Leaf x) = f x
  foldMap f (Node l x r) = foldMap f l <> f x <> foldMap f r

-- checks if a given value exists in the tree.
contains :: Ord a => Eq a => Tree a -> a -> Bool
contains (Leaf x)     y    = x == y
contains (Node l x r) y
  | x == y    = True
  | x > y     = contains l y 
  | otherwise = contains r y

-- returns all elements of the tree as a list.
to_list              :: Tree a -> [a]
to_list Void          = []
to_list (Leaf x)      = [x]
to_list (Node l x r)  = (to_list l) ++ [x] ++ (to_list r) 

-- TODO: merges two trees
merge_tree :: Ord a => Tree a -> Tree a -> Tree a
merge_tree Void tree                     = tree
merge_tree tree Void                     = tree
merge_tree (Leaf x) (Leaf y)             = Leaf y
merge_tree (Leaf x) (Node l y r)  
  | x >= y                               = Node l y (merge_tree (Leaf x) r) 
  | otherwise                            = Node (merge_tree (Leaf x) l) y r 
merge_tree  (Node l y r) (Leaf x)  
  | x >= y                               = Node l y (merge_tree (Leaf x) r) 
  | otherwise                            = Node (merge_tree (Leaf x) l) y r
merge_tree t1@(Node l1 x1 r1) t2@(Node l2 x2 r2)
  | x1 >= x2                             = Node (merge_tree l2 t1) x2 r2
  | otherwise                            = Node l1 x1 (merge_tree r1 t2)

-- TODO: removes a node from the tree.
remove_node :: Ord a            => Tree a -> a -> Tree a
remove_node Void _               = Void
remove_node (Leaf x) y 
  | x == y                       = Void
  | otherwise                    = (Leaf x)
remove_node (Node l x r) value   =
  if x == value
    then merge_tree r l
    else 
      if x > value
        then Node (remove_node l value) x r
        else Node l x (remove_node r value)

-- adds a new node to the tree.
add_node :: Ord a  => Tree a -> a -> Tree a
add_node Void x            = Leaf x
add_node (Leaf x) y
  | x == y                 = Leaf x
  | x > y                  = Node (Leaf y) x Void
  | otherwise              = Node Void x (Leaf y) 
add_node (Node l x r) y
  | x == y                 = Node l x r
  | x > y                  = Node (add_node l y) x r
  | otherwise              = Node l x (add_node r y)
