//
//  SlidePuzzle.swift
//  SlideNumberPuzzle
//
//  Created by Setthanan Thitathanapat on 19/11/2566 BE.
//

// SlidePuzzle.swift
import Foundation
import SwiftUI
import Combine

class SlidePuzzle: ObservableObject {
    @Published var gridSize = 4
    @Published var hasWon = false
    @Published var moveCount = 0
    @Published private var numbers: [Int]

    init() {
        self.numbers = []
        initGame()
    }

    func initGame() {
        numbers = Array(1...(gridSize * gridSize - 1)) + [0]
        numbers.shuffle()
    }

    func moveNumber(at index: Int) {
        let row = index / gridSize
        let column = index % gridSize
        
        withAnimation(Animation.easeInOut(duration: 0.5)) {
            if let above = row > 0 ? index - gridSize : nil, numbers[above] == 0 {
                numbers.swapAt(above, index)
                moveCount += 1
            } else if let below = row < gridSize - 1 ? index + gridSize : nil, numbers[below] == 0 {
                numbers.swapAt(below, index)
                moveCount += 1
            } else if let left = column > 0 ? index - 1 : nil, numbers[left] == 0 {
                numbers.swapAt(left, index)
                moveCount += 1
            } else if let right = column < gridSize - 1 ? index + 1 : nil, numbers[right] == 0 {
                numbers.swapAt(right, index)
                moveCount += 1
            }
        }
        checkWin()
    }

    func getNumber(num: Int) -> Int {
        return numbers[num]
    }

    func checkWin() {
        hasWon = numbers == Array(1...(gridSize * gridSize - 1)) + [0]
    }

    func newGame() {
        initGame()
        hasWon = false
        moveCount = 0
    }
}

