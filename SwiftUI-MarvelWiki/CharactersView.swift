//
//  CharactersView.swift
//  SwiftUI-MarvelWiki
//
//  Created by Кирилл Копытин on 15.12.2021.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharacterViewModel
    
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, alignment: .center, spacing: 16)  {
                    if let results = self.viewModel.items {
                        ForEach(results) { character in
                            CharacterCellView(character: character)
                                .frame(height: geometry.size.width/3)
                        }
                    }
                }
            }
        }
        .onAppear(perform: self.viewModel.onAppear)
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(viewModel: CharacterViewModel(marvelService: MarvelService()))
    }
}
