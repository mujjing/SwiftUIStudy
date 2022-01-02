//
//  AssetMenuButtonStyle.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2022/01/02.
//

import SwiftUI

struct AssetMenuButtonStyle: ButtonStyle {
    let menu: AssetMenu
    func makeBody(configuration: Configuration) -> some View {
        return VStack {
            Image(systemName: menu.systemImageName)
                .resizable()
                .frame(width: 30, height: 30)
                .padding([.leading, .trailing], 10.0)
            Text(menu.title)
                .font(.system(size:12, weight: .bold))
        }
        .padding(.all, 11.0)
        .foregroundColor(.blue)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AssetMenuButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing:24) {
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .creditScore))
            
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .bankAccount))
            
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .investment))
            
            Button("") {
                print("")
            }
            .buttonStyle(AssetMenuButtonStyle(menu: .loan))
            
//            Button("") {
//                print("")
//            }
//            .buttonStyle(AssetMenuButtonStyle(menu: .insurance))
//
//            Button("") {
//                print("")
//            }
//            .buttonStyle(AssetMenuButtonStyle(menu: .creditCard))
//
//            Button("") {
//                print("")
//            }
//            .buttonStyle(AssetMenuButtonStyle(menu: .cash))
//
//            Button("") {
//                print("")
//            }
//            .buttonStyle(AssetMenuButtonStyle(menu: .realEstate))
        }
        .background(Color.gray.opacity(0.2))
    }
}
