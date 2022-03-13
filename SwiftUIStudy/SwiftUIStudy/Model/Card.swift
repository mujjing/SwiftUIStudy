//
//  Card.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2022/03/13.
//

import Foundation

struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardImage: String
}

var cards: [Card] = [
    Card(name: "kakao 1", cardNumber: "4345 5647 7867 0987", cardImage: "card1"),
    Card(name: "kakao 2", cardNumber: "5678 8765 1234 2345", cardImage: "card2"),
    Card(name: "kakao 3", cardNumber: "0987 1234 6789 2456", cardImage: "card3")
]
