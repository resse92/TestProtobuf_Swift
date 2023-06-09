//
//  ContentView.swift
//  TestProtobuf
//
//  Created by chenmu on 2023/3/21.
//

import SwiftUI
import SubProtobuf

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
