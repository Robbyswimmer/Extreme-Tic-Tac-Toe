# Extreme-Tic-Tac-Toe
Tic Tac Toe – featuring the classic game and a new mode where you can choose the size of the board.

![Tic-Tac-Toe](/tictactoe-images/11x11-2.png)

## Why it exists

This project features two versions of the game: 1) the normal version everyone played growing up, and 2) a new version that allows players to determine the size of the board. In the normal version, you can win the game as expected: get three in a row on the horizontal, diagonal, or vertical. In the new version, however, the number of pieces you get in a row is dependent on the size of the board. Consequently, if the size of the board is 25 (the maximum size), a player must have 25 of their pieces in a row to win the game. 

While there is certainly not any good reason to play a 25x25 game of tic-tac-toe, it is the theory behind the game that makes it compelling as a project. As the size of the board increases, the number of squares on the board increases exponentially. In the class game the size of the board is '3' – 3x3 = 9 total squares on the board. In a game that uses the max board size, 25x25, there is a total of 625 spaces on the board. 

Computationally speaking, as the size of the board increases it becomes more and more expensive to check all of the spaces for a winner. Checking 9 spaces is no problem, but checking 625 spaces every turn is not only inefficient, but is completely unneccessary. For the new version of the game, a new system had to be devised to elegantly check for a game-winner without taking too much time, or being computationally expensive. 

For most computers, 625 iterations does not take long, but if this game were to be scaled to a board that was 100x100, 1000x1000, or larger, it would become increasingly necessary to be able to determine if a player won without checking every space on the board. This project is not only fun to play, but it is also interesting as a study in optimization.

## How it works

The normal version of this game is very simple. All of the spaces on the board, the board design, how long the game lasts, and other elements are hard-coded because none of the values change for this version of the game. The game cannot last more than 9 moves, it will always result in a winner or a tie, and there is only 9 spots on the board.

The spots on the board are represented by a dictionary, where the keys are the spots on the board, and the values are the existing pieces in those spots. Since every game starts with an empty board, all values start as empty strings.

```Swift
var spots = ["A1": " ", "A2": " ", "A3": " ", "B1": " ","B2": " ","B3": " ","C1": " ","C2": " ", "C3": " "]
```
Every round a move is accepted as input from the user in the form of the dictionary keys: A1, B2, C1, etc. If a spot is full or that spot doesn't exist, the player gets to choose a different spot. The game automatically rotates between X's and O's for the pieces, with the game always starting with X as the first piece.

```Swift
func moveDecider(nextMove: String, currentBoard: String) {
    print("You chose \(nextMove). Here is the current board: ")
    print()
    var next = nextMove
    next = nextMove.uppercased()
    currentLetter = currentLetterCounter % 2 > 0 ? "O" : "X"
    currentLetterCounter += 1
    spots.updateValue(currentLetter, forKey: "\(next)")
}

func letterPlacer(nextMove: String, currentBoard: String) -> Int {
    let next = nextMove.uppercased()
    if (spots["\(next)"] == " ") {
        moveDecider(nextMove: nextMove, currentBoard: currentBoard)
        return 0
    } else {
        print("Spot is already full! Pick Again!")
        return 1
    }
}
```

![Tic-Tac-Toe](/tictactoe-images/classic.png)

## Optimizing win-checking

## How to play
