//
//  SwiftUI_MarvelWikiTests.swift
//  SwiftUI-MarvelWikiTests
//
//  Created by Кирилл Копытин on 14.12.2021.
//

import XCTest
import Combine
@testable import SwiftUI_MarvelWiki

class SwiftUI_MarvelWikiTests: XCTestCase {
    
    var subscriptions = Set<AnyCancellable>()
    var comicsViewModel: ComicsViewModel!
    var marvelService: MarvelService!
    
    override func setUp() {
        self.marvelService = MarvelService()
        self.comicsViewModel = ComicsViewModel(marvelService: self.marvelService)
    }
    
    override func tearDown() {
        self.subscriptions = []
    }
    
    func testComicsFilter() {
        // Given
        let expected = "Choose: comic, digest"
        var result = ""
        
        self.comicsViewModel.$formatTypes
            .sink(receiveValue: { [weak self] _ in
                result = self?.comicsViewModel.filterText ?? "" })
            .store(in: &subscriptions)

        // When
        
        self.comicsViewModel.formatTypes = [.comic, .digest]
        
        // Then
        XCTAssert(
            result == expected,
            "Wrong header text. Expected: \(expected), result: \(result)"
        )
    }
}
