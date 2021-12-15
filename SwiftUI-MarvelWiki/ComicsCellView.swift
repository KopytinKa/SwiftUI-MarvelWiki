//
//  ComicsCellView.swift
//  SwiftUI-MarvelWiki
//
//  Created by Кирилл Копытин on 15.12.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicsCellView: View {
    let comics: ComicsDisplayItem
    
    var body: some View {
        VStack {
            Text("\(self.comics.title)")
                .lineLimit(2)
            
            WebImage(url: URL(string: self.comics.image))
                .resizable()
                .frame(height: 200)
            
            Text("\(self.comics.description ?? "")")
                .lineLimit(3)
        }
        .frame(width: 150)
    }
}

struct ComicsCellView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsCellView(
            comics: ComicsDisplayItem(
                id: 123,
                title: "Batman 1989",
                description: "WOW! It's amazing dfvd dfg dfg dfg   dfg  dfg  dfg  dfg  dfg dfg dfgdfg dfgdfgdfgdfgdfgdfgdfg dfgdfg dfgdfgdfg dfgdfg dfgdfg dfgdfgdfg  dfg   dfgdfgdfgdfg  dfgdfgdfg dfgdfgdfg",
                modified: "asdada asd asd ",
                resourceURI: "daasda",
                image: "https://klike.net/uploads/posts/2019-05/1556708032_1.jpg"
            )
        )
    }
}
