//
//  CharacterViewModel.swift
//  MarvelWiki
//
//  Created by Кирилл Копытин on 19.11.2021.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    private let marvelService: MarvelService
    private var subscriptions: Set<AnyCancellable> = []
    
    private(set) var characters: [CharacterDTO]?
    
    @Published var items: [CharacterDisplayItem] = []
    
    init(marvelService: MarvelService) {
        self.marvelService = marvelService
    }
    
    func onAppear() {
        self.fetchCharacters()
    }
    
    // MARK: Private
    
    private func fetchCharacters() {
        self.marvelService.loadCharacters()
            .handleEvents(receiveSubscription: { _ in
                print("🐱 request will start")
            }, receiveOutput: { _ in
                print("🐱 request data received")
            }, receiveCancel: {
                print("🐱 request cancelled")
            })
            .sink(receiveCompletion: { print($0) }, receiveValue: {
                let characters = $0.data.results
                self.characters = characters
                self.makeDisplayItems(from: characters)
            })
            .store(in: &self.subscriptions)
    }
    
    private func makeDisplayItems(from items: [CharacterDTO]) {
        self.items = CharacterDisplayItemFabric.makeItems(with: items)
        self.objectWillChange.send()
    }
}
