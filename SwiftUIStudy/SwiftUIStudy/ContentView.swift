//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2021/09/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            page1().tabItem {
                VStack {
                    Image(systemName: "house.fill")
                    Text("home").fontWeight(.light)
                }
            }
            page2().tabItem {
                VStack {
                    Image(systemName: "flame.fill")
                    Text("news").fontWeight(.light)
                }
            }
            page3().tabItem {
                VStack {
                    Image(systemName: "paperplane.fill")
                    Text("share").fontWeight(.light)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct page1: View {
    var body: some View {
        Text("Hello from page1")
            .fontWeight(.heavy)
    }
}

struct page2: View {
    var body: some View {
        Text("Hello from page2")
            .fontWeight(.heavy)
    }
}

struct page3: View {
    var body: some View {
        Text("Hello from page3")
            .fontWeight(.heavy)
    }
}
