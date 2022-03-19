//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2021/09/18.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var getData = datas()
    
    var body: some View {
        NavigationView {
            List(getData.jsonData) { i in
                ListRow(url: i.avatar_url, name: i.login)
            }
        }.navigationBarTitle("Json Parsing")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class datas: ObservableObject {
    @Published var jsonData = [datatype]()
    
    init() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "https://api.github.com/users/hadley/orgs")!) { (data, _, _) in
            do {
                let fetch = try JSONDecoder().decode([datatype].self, from: data!)
                DispatchQueue.main.async {
                    self.jsonData = fetch
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

struct datatype : Identifiable, Codable {
    var id : Int
    var login : String
    var node_id : String
    var avatar_url : String
}

struct ListRow : View {
    var url : String
    var name : String
    
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: url)).resizable().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 20)
            Text(name).fontWeight(.heavy).padding(.leading, 10)
        }
    }
}
