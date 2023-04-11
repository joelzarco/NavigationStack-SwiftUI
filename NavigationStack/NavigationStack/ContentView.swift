//
//  ContentView.swift
//  NavigationStack
//
//  Created by sergio joel camacho zarco on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    
    var platforms : [Platform] = [.init(name: "XBox", imageName: "xbox.logo", color: .green),
                                  .init(name: "PlayStation", imageName: "playstation.logo", color: .indigo),
                                  .init(name: "PC", imageName: "desktopcomputer", color: .pink),
                                  .init(name: "mobile", imageName: "iphone", color: .teal)]
    
    var games : [Game] = [.init(name: "Minecraft", rating: "99"),
                          .init(name: "God of War", rating: "98"),
                          .init(name: "Fortnite", rating: "71"),
                          .init(name: "Formula 1", rating: "89")]
    
    var body: some View {
        
        NavigationStack{
            List{
                Section("Platforms"){
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform){
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    } //ForE
                } // Sec Plats
                Section("Games"){
                    ForEach(games, id : \.name){ game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                } // sec2
            } // Lis
            .navigationTitle("Gaming")
            // destination for each platform in here
            .navigationDestination(for: Platform.self) { platform in
                // dummy view just for demo, detail view would be here
                ZStack{
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle).bold()
                }
            } // navDest
            // navStack can handle multiple destLinks
            .navigationDestination(for: Game.self) { game in
                ZStack{
                    Text("\(game.name) \(game.rating)")
                        .font(.largeTitle).bold()
                }
            }
        } // NavStack
    }
}


struct Platform : Hashable{ // needs to conform to hashable
    let name : String
    let imageName : String
    let color : Color
}

struct Game : Hashable{
    let name : String
    let rating : String
}
