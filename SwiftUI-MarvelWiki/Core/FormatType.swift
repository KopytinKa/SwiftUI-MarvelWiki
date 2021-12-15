//
//  FormatType.swift
//  SwiftUI-MarvelWiki
//
//  Created by Кирилл Копытин on 15.12.2021.
//

import Foundation

enum FormatType: String, CaseIterable, Identifiable {
    case comic
    case magazine
    case hardcover
    case digest
    
    var id: String {
        return self.rawValue
    }
}
