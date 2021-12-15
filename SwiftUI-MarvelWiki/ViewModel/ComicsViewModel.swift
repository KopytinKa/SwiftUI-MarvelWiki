//
//  ComicsViewModel.swift
//  MarvelWiki
//
//  Created by Кирилл Копытин on 19.11.2021.
//

import Foundation
import Combine

class ComicsViewModel: ObservableObject {
    private let marvelService: MarvelService
    private var subscriptions: Set<AnyCancellable> = []
    
    private(set) var comics: [ComicsDTO]?
    
    @Published var items: [ComicsDisplayItem] = []
    @Published var formatTypes: [FormatType] = []
    
    var filterText: String {
        guard !formatTypes.isEmpty else {
            return "All formats"
        }
        
        return formatTypes
            .reduce("") { (res, type) -> String in
                return res.isEmpty
                ? "Choose: " + type.rawValue
                : res + ", " + type.rawValue
            }
    }

    
    init(marvelService: MarvelService) {
        self.marvelService = marvelService
    }
    
    func onAppear() {
        self.fetchComics()
    }
    
    // MARK: Private
    
    private func fetchComics() {
        self.marvelService.loadComics()
            .sink(receiveCompletion: { print($0) }, receiveValue: {
                let comics = $0.data.results
                self.comics = comics
                self.makeDisplayItems(from: comics)
            })
            .store(in: &self.subscriptions)
    }
    
    private func makeDisplayItems(from items: [ComicsDTO]) {
        self.items = ComicsDisplayItemFabric.makeItems(with: items)
        self.objectWillChange.send()
    }
}
