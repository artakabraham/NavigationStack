//
//  ContentView.swift
//  NavigationStack
//
//  Created by Artak Abrahamyan on 26.06.23.
//

import SwiftUI

var platforms : [Platform] = [
    .init(name: "Xbox", imageName: "xbox.logo", color: .green),
    .init(name: "PlayStation", imageName: "playstation.logo", color: .indigo),
    .init(name: "PC", imageName: "pc", color: .pink),
    .init(name: "Mobile", imageName: "iphone", color: .mint)]

var games : [Game] = [
    .init(name: "Minecraft", rating: "99"),
    .init(name: "God of War", rating: "98"),
    .init(name: "Fortnite", rating: "93"),
    .init(name: "Madden 2023", rating: "88")]

struct ContentView: View {
    var body: some View {
        NavigationStack{
            List {
                Section("PLatform"){
                    ForEach(platforms, id: \.name){ platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundColor(platform.color)
                        }
                    }
                }
                Section("Games"){
                    ForEach(games, id: \.name){ game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self){ platform in
                ZStack{
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: platform.imageName)
                        .font(.largeTitle).bold()
                }
            }
            .navigationDestination(for: Game.self){ game in
                Text("\(game.name) - \(game.rating)")
                    .font(.largeTitle.bold())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
