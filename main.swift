//
//  main.swift
//  TicTacToe
//
//  Created by Robby Moseley on 5/2/19.
//  Copyright © 2019 Robby Moseley. All rights reserved.
//

import Foundation
//print("   1   2   3 ")
//print("A  x |   |   ")
//print("  ---|---|---")
//print("B    |   |   ")
//print("  ---|---|---")
//print("C    |   |   ")

var dict = createDictionary(size: 8)

startMessageGeneral()
var input = readLine()

if (input == "1") {
    startMessageRegular()
    playGame()
} else {
    startMessageExtreme()
    updateBoard()
}







