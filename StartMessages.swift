//
//  StartMessage.swift
//  TicTacToe
//
//  Created by Robby Moseley on 5/2/19.
//  Copyright © 2019 Robby Moseley. All rights reserved.
//

import Foundation

func startMessageGeneral() {
    let message = """
                  Hello! Welcome to TicTacToe!
                  If you would like to play the
                  original game of TicTacToe enter 1,
                  if you would like to play TicTacToe
                  Extreme, enter a 2.
                  """
    print(message)
}

func startMessageExtreme() {
    let message = """
                    This game works the same as regular TicTacToe.
                    In order to win you simply have to get an entire
                    row, column or diagonal of the same letter.
                    The program is going to ask you to enter the size
                    of the board, once you do that the game will begin.
                    To enter moves simply reference the numbers along the top
                    of the board and the letters along the left side. For example,
                    if you chose the move A1 the letter would be placed in the
                    upper left-hand corner.
                    
                    Have fun! X goes first!
                  """
    print(message)
    
}

func startMessageRegular() {
    let message = """
                    This is regular, good old-fashioned TicTacToe! Get three
                    in a row to be crowned the winner!
                    To enter moves simply reference the numbers along the top
                    of the board and the letters along the left side. For example,
                    if you chose the move A1 the letter would be placed in the
                    upper left-hand corner.
                    
                    Have fun! X goes first!
                  """
    print(message)
    
}
