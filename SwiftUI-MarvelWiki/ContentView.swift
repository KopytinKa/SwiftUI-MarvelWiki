//
//  ContentView.swift
//  SwiftUI-MarvelWiki
//
//  Created by Кирилл Копытин on 14.12.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var marvelService: MarvelService
    
    var body: some View {
        VStack {
            ComicsView(viewModel: ComicsViewModel(marvelService: marvelService))
            CharactersView(viewModel: CharacterViewModel(marvelService: marvelService))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
