//
//  SwiftUI_MarvelWikiApp.swift
//  SwiftUI-MarvelWiki
//
//  Created by Кирилл Копытин on 14.12.2021.
//

import SwiftUI

@main
struct SwiftUI_MarvelWikiApp: App {
    let marvelService = MarvelService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(self.marvelService)
        }
    }
}
