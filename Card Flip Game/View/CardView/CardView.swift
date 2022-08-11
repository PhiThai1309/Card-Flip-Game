//
//  CardView.swift
//  Memory Game
//
//  Created by Phi Thai on 09/08/2022.
// https://github.com/SamuelDo02/swiftuitutorials/blob/main/Flashcard.swift

import Foundation
import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    
    let width: Int = 80
    @State var check = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    @Binding var MatchedCard:[Card]
    @Binding var UserChoices:[Card]
    var body: some View {
        if(card.isFaceUp) {
            Text(card.text)
                .font(.system(size: CGFloat(width - 40)))
                .frame(width: CGFloat(width), height: CGFloat(width))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 5))
            
        } else {
            if !MatchedCard.contains(where: {$0.id == card.id}) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red)
                    .frame(width: CGFloat(width), height: CGFloat(width))
//                    .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        card.turnOver()
                        UserChoices.append(card)
                        if UserChoices.count == 2 {
                            withAnimation(Animation.linear.delay(1)) {
                                flipFlashcard()
                            }
                            checkForMatch()
                        }
                    }
//                    .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
            } else {
                Text(card.text)
                    .frame(width: CGFloat(width), height: CGFloat(width))
                    .opacity(0.0)
            }
        }
    }
    
    func checkForMatch(){
        if UserChoices[0].text == UserChoices[1].text {
            MatchedCard.append(UserChoices[0])
            MatchedCard.append(UserChoices[1])
        }
        UserChoices.removeAll()
    }
    
    func flipFlashcard() {
        flashcardRotation += 180
        contentRotation += 180
        for thisCard in UserChoices {
            thisCard.turnOver()
        }
    }
}
