//
//  PlayGame.swift
//  TicTacToe
//
//  Created by Robby Moseley on 5/2/19.
//  Copyright © 2019 Robby Moseley. All rights reserved.
//

import Foundation
var counter = 1
var currentLetterCounter = 0
var currentLetter = "O"
var spots = ["A1": " ", "A2": " ", "A3": " ", "B1": " ","B2": " ","B3": " ","C1": " ","C2": " ", "C3": " "]
var finalBoard = ""

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

func win() -> Bool {
    
    //checks rows
    if (spots["A1"] == spots["A2"] && spots["A1"] == spots["A3"] && spots["A1"] != " ") {return true}
    if (spots["B1"] == spots["B2"] && spots["B1"] == spots["B3"] && spots["B1"] != " ") {return true}
    if (spots["C1"] == spots["C2"] && spots["C1"] == spots["C3"] && spots["C1"] != " ") {return true}

    //checks columns
    if (spots["A1"] == spots["B1"] && spots["A1"] == spots["C1"] && spots["A1"] != " ") {return true}
    if (spots["A2"] == spots["B2"] && spots["A2"] == spots["C2"] && spots["A2"] != " ") {return true}
    if (spots["A3"] == spots["B3"] && spots["A3"] == spots["C3"] && spots["A3"] != " ") {return true}

    //checks diagonals
    if (spots["A1"] == spots["B2"] && spots["A1"] == spots["C3"] && spots["A1"] != " ") {return true}
    if (spots["A3"] == spots["B2"] && spots["A3"] == spots["C1"] && spots["A3"] != " ") {return true}
    
    return false;
}

func playGame() {
    
    print("Here is the starting board!")
    print()
    while (counter <= 10) {
       
        //the board with each spot corresponding to a value in the spots dictionary
        let currentBoard = """
                      1   2   3
                    A  \(spots["A1"]!) | \(spots["A2"]!) | \(spots["A3"]!)
                      ---|---|---
                    B  \(spots["B1"]!) | \(spots["B2"]!) | \(spots["B3"]!)
                      ---|---|---
                    C  \(spots["C1"]!) | \(spots["C2"]!) | \(spots["C3"]!)
        """
        if win() {
            print("You won! Here is the final board!")
            finalBoard = currentBoard
            break
        } else if (counter == 10) {
            print("It's a tie!")
            finalBoard = currentBoard
            break
        } else {
            print(currentBoard)
        }
        
        //gets the next move from the user
        print()
        print("Enter move: ", terminator: "")
        let nextMove = readLine()
        //print("Your next move is: \(nextMove!)")
        
        //determines what the next move is, or starts over, if that spot on the board was already full
        if (letterPlacer(nextMove: nextMove!, currentBoard: currentBoard)) == 1 { continue }
       
        //increments the counter to keep track of the current move
        counter += 1
    }
    print(finalBoard)
    print()
}
