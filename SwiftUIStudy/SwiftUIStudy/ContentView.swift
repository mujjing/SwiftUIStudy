//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2021/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        grid()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct grid : View {
    var body: some View {
        GeometryReader { geo in
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    ForEach(1..<6) { i in
                        HStack {
                            Image("image\(i)").resizable().frame(width: geo.size.width / 2 - 20).cornerRadius(15)
                            Image("image\(i)").resizable().frame(width: geo.size.width / 2 - 20).cornerRadius(15)
                        }.padding(.horizontal).frame(height: UIDevice.current.orientation.isLandscape ? 300 : 150)
                    }
                }
            }
        }
    }
}
