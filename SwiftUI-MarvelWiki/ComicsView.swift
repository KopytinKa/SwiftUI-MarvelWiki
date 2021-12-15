//
//  ComicsView.swift
//  SwiftUI-MarvelWiki
//
//  Created by Кирилл Копытин on 15.12.2021.
//

import SwiftUI

struct ComicsView: View {
    @ObservedObject var viewModel: ComicsViewModel
    
    let rows = [
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: .center, spacing: 16)  {
                    if let results = self.viewModel.items {
                        ForEach(results) { comics in
                            ComicsCellView(comics: comics)
                        }
                    }
                }
            }
        }
        .onAppear(perform: self.viewModel.onAppear)
    }
}

struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView(viewModel: ComicsViewModel(marvelService: MarvelService()))
    }
}
