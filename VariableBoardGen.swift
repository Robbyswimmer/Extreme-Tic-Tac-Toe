//
//  VariableBoard.swift
//  TicTacToe
//
//  Created by Robby Moseley on 5/3/19.
//  Copyright © 2019 Robby Moseley. All rights reserved.
//

import Foundation
var newCurrentLetter = "X"
var newCurrentLetterCounter = 0
var move = 0
var xMoves = 0
var oMoves = 0
var totalMoves = 0

func getInput() -> Int {
    print("  Enter the size of the board: ", terminator: "")
    let boardSize = readLine()
    let bs = Int(boardSize!)
    return bs!
}

//creates a dictionary of the given size for each spot on the board
func createDictionary(size: Int) -> Dictionary<String, String> {
    var spots = [String : String]()
    for i in 0..<size {
        let currentLetter = Int(("A" as UnicodeScalar).value)
        let key = ("\(Character(UnicodeScalar(i + currentLetter)!))")
        for i in 1...size {
            spots.updateValue(" ", forKey: "\(key)\(i)")
        }
    }
    return spots
}

//the win condition for this board is when someone obtains an entire row
//of the same shape
func winCondition(size: Int, dict: Dictionary<String, String>, move: String) -> Bool {
    
    //this block checks rows, columns, and both diagonals for the win condition
    var rowCounter = 0
    var diagonalCounterLR = 0
    var columnCounter = 0
    var diagonalCounterRL = 0
    for i in 1...size {
        
        //defines the keys needed to check the dictionary spots
        let rowLetter = move.prefix(1)
        let columnNumber = move.suffix(1)
        let dLetter = Int(("A" as UnicodeScalar).value)
        let diagonalLetter = ("\(Character(UnicodeScalar((i - 1) + dLetter)!))")
        let rowKey = "\(rowLetter)\(i)"
        let diagonalKey = "\(diagonalLetter)\(i)"
        let columnKey = "\(diagonalLetter)\(columnNumber)"
        let adjustedI = (i - size - 1) * -1
        let diagonalKeyRL = "\(diagonalLetter)\(adjustedI)"
        
        //checks for the rows
        if (dict[rowKey] == "X") { rowCounter += 1 }
        if (dict[rowKey] == "O") { rowCounter -= 1 }
        if (rowCounter == size || rowCounter == size * -1) { return true }
        
        //checks for the rows
        if (dict[columnKey] == "X") { columnCounter += 1 }
        if (dict[columnKey] == "O") { columnCounter -= 1 }
        if (columnCounter == size || columnCounter == size * -1) { return true }

        //checks for the L -> R diagonal
        if (dict[diagonalKey]! == "X") {diagonalCounterLR += 1}
        if (dict[diagonalKey]! == "O") {diagonalCounterLR -= 1}
        if (diagonalCounterLR == size || diagonalCounterLR == size * -1) { return true }

        //checks for the R -> L diagonal
        if (dict[diagonalKeyRL]! == "X") {diagonalCounterRL += 1}
        if (dict[diagonalKeyRL]! == "O") {diagonalCounterRL -= 1}
        if (diagonalCounterRL == size || diagonalCounterRL == size * -1) { return true }
    }
    return false
}

func printBoard(size: Int, dict: Dictionary<String, String>) {
    
    //prints the numbers at the top of the board
    print("   ", terminator: "")
    for i in 1...size {
        if (i < 10) {
            print("\(i)   ", terminator: "")
        } else {
            print("\(i)  ", terminator: "")
        }
    }
    print()
    
     //loops for creating the board based on the given size
    for i in 0..<size {
        let currentLetter = Int(("A" as UnicodeScalar).value)
        print("\(Character(UnicodeScalar(i + currentLetter)!)) ", terminator: "")
        let letter = ("\(Character(UnicodeScalar(i + currentLetter)!))")
        //responsible for printing the dictionary values in a given spot
        for i in 1...size {
            let key = ("\(letter)\(i)")
            let tempVal = dict[key]!
            if (i == size) {
                print(" \(tempVal) ", terminator: "")
                break
            }
            print(" \(tempVal) |", terminator: "")
        }
        print()
        //only responsible for printing the correct design of the board
        print("  ", terminator: "")
        if (i != size - 1) {
            for i in 1...size {
                if (i == size) {
                    print("---", terminator: "")
                    break
                }
                print("---|", terminator: "")
            }
        }
        print()
    }
}

//creates the board using the dictionary created above
func updateBoard() {
    
    //gets the size for the board and creates the dictionary
    var size = getInput()
    while (size % 2 == 0 || size > 26) {
        print("Please enter an odd number and a number less than 26!")
        size = getInput()
    }
    dict = createDictionary(size: size)
    print()
    
    //prints an initial board to show the user the size they chose
    printBoard(size: size, dict: dict)
    
    //loops until someone wins or all of the boards spots are full
    var i = 0
    while (i < size * size) {
        print("Play your next move: ", terminator: "")
        let nextMove = readLine()
        let next = nextMove?.uppercased()
        
        //checks to see if a spot is already full or not
        if (dict[next!] != " ") {
            print("That spot is already full! Pick again!")
            continue
        }
        
        
        //changes the current letter, increments the counter for determining the letter,
        //updates the dictionary with this moves choice, and prints the board with the
        //new move
        newCurrentLetter = newCurrentLetterCounter % 2 > 0 ? "O" : "X"
        newCurrentLetterCounter += 1
        dict.updateValue(newCurrentLetter, forKey: "\(next!)")
        print()
        printBoard(size: size, dict: dict)
        
        //i is used to keep track of the current move
        i += 1
        totalMoves = i
        
        if (newCurrentLetter == "X") {xMoves += 1}
        if (newCurrentLetter == "O") {oMoves += 1}
        let boardSpaces = size * size
        
        let stats = """
                    Here are some stats for that round:
                    Number of moves made by the X-player: \(xMoves)
                    Number of moves made by the O-player: \(oMoves)
                    Total number of moves made by both players: \(totalMoves)
                    Number of board spaces that round: \(boardSpaces)
                    """
        
        //checks the win condition
        if (winCondition(size: size, dict: dict, move: next!) == false) {
            continue
        } else if (i == size * size - 1)  {  //this is for when the board is entirely full
            print("It's a tie!")
            print()
            print(stats)
            print()
            break
        } else {
            print("You win! Great game!") //when the program detects that someone has won
            print()
            print(stats)
            print()
            break
        }
    }
}
