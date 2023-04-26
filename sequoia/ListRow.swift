//
//  ListRow.swift
//  Sequeia
//
//  Created by chengmengmeng on 2023/4/26.
//

import SwiftUI
    
struct ListRow: View {
    var item: Item
    @State var like: Bool
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: self.item.artworkUrl512)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
            } placeholder: {
                //
            }
            
            VStack(alignment: .leading) {
                Text("\(self.item.trackName) - \(self.item.sellerName)")
                    .font(.title2)
                    .lineLimit(1)
                Text("\(self.item.description)")
                    .lineLimit(1)
            }.frame(width: 240)
            Button(action:{
                self.like = true
            }) {
                Image(self.like ? "like":"dark_like")
            }.padding(.leading)
        }
    }
}
