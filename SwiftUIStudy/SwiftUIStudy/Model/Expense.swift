//
//  Expense.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2022/03/13.
//

import Foundation

struct Expense: Identifiable {
    var id = UUID().uuidString
    var amountSpent: String
    var product: String
    var productIcon: String
    var spendType: String
}

var expenses: [Expense] = [
    Expense(amountSpent: "$128", product: "Amazon", productIcon: "icon1", spendType: "Groceries"),
    Expense(amountSpent: "$18", product: "Youtube", productIcon: "icon2", spendType: "Streaming"),
    Expense(amountSpent: "$10", product: "Dribble", productIcon: "icon3", spendType: "MemberShip"),
    Expense(amountSpent: "$28", product: "Apple", productIcon: "icon4", spendType: "Apple Pay"),
    Expense(amountSpent: "$9", product: "Patron", productIcon: "icon5", spendType: "MemberShip"),
]
