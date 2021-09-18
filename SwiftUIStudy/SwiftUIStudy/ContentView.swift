//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2021/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Image("j").resizable(resizingMode: .tile)
                .frame(width: 150, height: 150)
            Image("j").resizable(capInsets: .init(top: 0, leading: 50, bottom: 0, trailing: 0))
                .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
