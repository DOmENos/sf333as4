//
//  ContentView.swift
//  SlideNumberPuzzle
//
//  Created by Setthanan Thitathanapat on 18/11/2566 BE.
//

// ContentView.swift
import SwiftUI

struct ContentView: View {
    @ObservedObject var gameModel: SlidePuzzle

    var body: some View {
        VStack {
            Spacer()
            Text("Number Slide Puzzle")
                .font(.largeTitle)
                .foregroundColor(.gray)
                .bold()
            Spacer()
            cards
                .foregroundColor(.orange)
            Spacer()
            Text(gameModel.hasWon ? "You Won!!!" : "")
                .foregroundColor(.black)
                .font(.largeTitle).bold()
            Spacer()
            HStack {
                Text("Moves: \(gameModel.moveCount)")
                    .foregroundColor(.blue)
                    .font(.title).bold()
                Spacer()
                Button("New Game") {
                    gameModel.newGame()
                }
                .font(.title)
                .padding()
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(12)
            }
            .padding()
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem](repeating: GridItem(.adaptive(minimum: 80)), count: gameModel.gridSize), spacing: 10) {
            createCards()
        }
    }

    func createCards() -> some View {
        ForEach(0..<(gameModel.gridSize * gameModel.gridSize)) { index in
            CardView(number: gameModel.getNumber(num: index))
                .aspectRatio(1, contentMode: .fit)
                .onTapGesture {
                    gameModel.moveNumber(at: index)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameModel: SlidePuzzle())
    }
}





