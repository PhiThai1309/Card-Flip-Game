//
//  ContentView.swift
//  Memory Game
//
//  Created by Phi Thai on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    private var grid = [GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    var body: some View {
        LazyVGrid(columns: grid, spacing: 10) {
            ForEach(cards) {
                card in
                CardView(card: card, MatchedCard: $MatchedCards, UserChoices: $UserChoices)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
