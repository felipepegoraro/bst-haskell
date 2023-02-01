## bst-haskell

This repository contains an implementation of a 
Binary Search Tree in Haskell.

### About

The `Main.hs` file contains a few tests for the functions in `Tree.hs`.
When you run the program, you will see the results of these tests.

The `Tree.hs` file includes the following functions:

- `contains`: checks if a given value exists in the tree.
- `to_list`: returns all elements of the tree as a list.
- `merge_tree`: merges two trees.
- `remove_node`: removes a node from the tree.
- `add_node`: adds a new node to the tree.

### Usage

To use the bst-haskell program, follow these steps:

1. Download the repository:

```sh
git clone https://github.com/felipepegoraro/bst-haskell.git
cd bst-haskell/
```

2. Compile the program:
```sh
ghc Main.hs -o main.out
```

3. Run the program:
```sh
./main.out
```

### License
This project is licensed under the terms of the GNU license.
