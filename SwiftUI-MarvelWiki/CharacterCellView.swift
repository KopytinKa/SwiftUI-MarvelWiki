//
//  CharacterCellView.swift
//  SwiftUI-MarvelWiki
//
//  Created by Кирилл Копытин on 15.12.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCellView: View {
    let character: CharacterDisplayItem
    
    var body: some View {
        VStack {
            Text("\(self.character.name)")
                .lineLimit(2)
            
            HStack {
                WebImage(url: URL(string: self.character.image))
                    .resizable()
                
                Text("\(self.character.description)")
            }
        }
    }
}

struct CharacterCellView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCellView(
            character: CharacterDisplayItem(
                id: 123,
                name: "Batman",
                description: "WOW! It's amazing dfvd dfg dfg dfg   dfg  dfg  dfg  dfg  dfg dfg dfgdfg dfgdfgdfgdfgdfgdfgdfg dfgdfg dfgdfgdfg dfgdfg dfgdfg dfgdfgdfg  dfg   dfgdfgdfgdfg  dfgdfgdfg dfgdfgdfg",
                modified: "asdada asd asd ",
                resourceURI: "daasda",
                image: "https://klike.net/uploads/posts/2019-05/1556708032_1.jpg"
            )
        )
    }
}
