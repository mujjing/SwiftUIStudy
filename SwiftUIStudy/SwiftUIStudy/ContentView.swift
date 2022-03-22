//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2021/09/18.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab = 0
    var body: some View {
        VStack(spacing: 0) {
            Picker(selection: $currentTab, label: Text("")) {
                Image(systemName: "house.fill").tag(0)
                Image(systemName: "flame.fill").tag(1)
                Image(systemName: "paperplane.fill").tag(2)
                
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
            if currentTab == 0 {
                page1()
            }
            if currentTab == 1 {
                page2()
            }
            if currentTab == 2 {
                page3()
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
        Text("page1").padding()
    }
}

struct page2: View {
    var body: some View {
        Text("page2")
    }
}

struct page3: View {
    var body: some View {
        Text("page3")
    }
}
