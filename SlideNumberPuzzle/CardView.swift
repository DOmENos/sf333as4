//
//  CardView.swift
//  SlideNumberPuzzle
//
//  Created by Setthanan Thitathanapat on 19/11/2566 BE.
//

// CardView.swift
import SwiftUI

struct CardView: View {
    let number: Int

    var body: some View {
        ZStack {
            if number != 0 {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 2)
                    )
                Text("\(number)")
                    .font(.largeTitle)
                    .bold()
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
            }
        }
    }
}


