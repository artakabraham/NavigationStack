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
            }
            .navigationTitle("Gaming")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
