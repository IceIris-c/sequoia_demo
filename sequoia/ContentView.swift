//
//  ContentView.swift
//  sequoia
//
//  Created by chengmengmeng on 2023/4/26.
//

import SwiftUI

struct ContentView: View {
    var items: rawItem = load("datas.json")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("App")
                .font(.title)
            ScrollView(.vertical, showsIndicators: true) {
                ForEach(0 ... items.results.count-1, id: \.self) { index in
                    ListRow(item: items.results[index], like: false)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
