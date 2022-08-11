//
//  HomeView.swift
//  Memory Game
//
//  Created by Phi Thai on 10/08/2022.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var showMenu = false
    var body: some View {
        GeometryReader {
            geo in
            ZStack(alignment: .leading) {
                VStack {
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Text("Show Menu")
                    }
                    HomeView()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .offset(x: self.showMenu ? geo.size.width/2 : 0)
                        .disabled(self.showMenu ? true : false)
                        .transition(.move(edge: .leading))
                }
                if self.showMenu {
                    MenuView()
                        .frame(width: geo.size.width / 2)
                }
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
