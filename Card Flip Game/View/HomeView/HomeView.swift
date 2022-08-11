//
//  HomeView.swift
//  Memory Game
//
//  Created by Phi Thai on 10/08/2022.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader {
            geo in
            VStack {
                Button("Play game") {}
                HStack {
                    Button("Leaderboard"){}
                    Button("How to play") {}
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
