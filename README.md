# Antikythera
This program brute-forces a wooden puzzle designed to be reminiscent of the Antikythera mechanism, an ancient mechanical computer of Greek origin capable of accurately predicting astronomical phenomena. The device that inspired the puzzle is perhaps symbolic of the history of computer science as it is the first known instance of what can be defined as a "computer," however the puzzle itself consists of a single rule: "Turn the dials until each column of numbers sums to 42." Though this isn't a particularly engrossing task to engage in by hand, solving the problem in Haskell offered an opportunity to practice functional programming patterns.

## Building
Building requires The Glasgow Haskell Compiler. Run `make` inside the project directory to create a binary.

Only confirmed to work on Linux systems, but may work on Mac OS and Windows too as there are no dependencies besides the standard Haskell library.

## Output Sample
```
Column A: [6,15,9,12]
       B: [8,13,13,8]
       C: [10,21,5,6]
       D: [11,14,9,8]
       E: [7,15,10,10]
       F: [11,9,19,3]
       G: [15,9,8,10]
       H: [6,12,12,12]
       I: [8,11,22,1]
       J: [7,4,26,5]
       K: [3,14,16,9]
       L: [14,7,14,7]

Viewing horizontally represents the solution values of
the radial number columns and vertically represents the
final values of the puzzle as concentric rings, where
the left most column is the inner most ring.
(The solution image may be helpful)
```

## Solution Image
![solution_picture](https://user-images.githubusercontent.com/61144046/158664620-33ae6797-3786-4dce-9d2c-3a2e22c1d529.jpg)
