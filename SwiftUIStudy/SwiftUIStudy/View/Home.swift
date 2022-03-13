//
//  Home.swift
//  SwiftUIStudy
//
//  Created by 전지훈 on 2022/03/13.
//

import SwiftUI

struct Home: View {
    //MARK: Animation Properties
    @State var expandCards: Bool = false
    
    //MARK: Detail View Properties
    @State var currentCard: Card?
    @State var showDetailCard: Bool = false
    @Namespace var animation
    var body: some View {
        VStack(spacing: 10) {
                Text("Wallet")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: expandCards ? .leading : .center)
                    .overlay(alignment: .trailing) {
                        
                        //MARK: Close Button
                        Button {
                            //Closing Cards
                            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                                expandCards = false
                            }
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding(10)
                                .background(.blue, in: Circle())
                        }
                        .rotationEffect(.init(degrees: expandCards ? 45 : 0))
                        .offset(x: expandCards ? 10 : 15)
                        .opacity(expandCards ? 1 : 0)
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)
                
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0) {
                    ForEach(cards){ card in
                        // If you want pure transition without this little opacity change in the sense just remove this if...else
                        Group {
                            if currentCard?.id == card.id && showDetailCard {
                                CardView(card: card)
                                    .opacity(0)
                            } else {
                                CardView(card: card)
                                    .matchedGeometryEffect(id: card.id, in: animation)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                currentCard = card
                                showDetailCard = true
                            }
                        }
                    }
                }
                .overlay{
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)){
                                expandCards = true
                            }
                        }
                }
                .padding(.top, expandCards ? 30 : 0)
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)
            
            //MARK: Add Button
            Button {
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.blue, in: Circle())
            }
            .rotationEffect(.init(degrees: expandCards ? 180 : 0))
            // To Avoid Warning 0.01
            .scaleEffect(expandCards ? 0.01 : 1)
            .opacity(!expandCards ? 1 : 0)
            .frame(height: expandCards ? 0 : nil)
            .padding(.bottom, expandCards ? 0 : 30)
            
        }
        .padding([.horizontal, .top])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay {
            if let currentCard = currentCard, showDetailCard {
                DetailView(currentCard: currentCard, showDetailCard: $showDetailCard, animation: animation)
            }
        }
    }
    @ViewBuilder
    func CardView(card: Card)->some View {
        GeometryReader{proxy in
            let rect = proxy.frame(in: .named("SCROLL"))
            //Let's display some Portion of each Card
            let offset = CGFloat(getIndex(Card: card) * (expandCards ? 10 : 70))
            
            ZStack(alignment: .bottomLeading) {
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                VStack(alignment: .leading, spacing: 10) {
                    Text(card.name)
                    Text(card.cardNumber)
                        .font(.callout)
                        .fontWeight(.bold)
                }
                .padding()
                .padding(.bottom, 10)
                .foregroundColor(.white)
            }
            .padding(.horizontal)
            .offset(y: expandCards ? offset : -rect.minY + offset)
        }
        .frame(height: 200)
    }
    
    func getIndex(Card: Card) -> Int {
        return cards.firstIndex { currentCard in
            return currentCard.id == Card.id
        } ?? 0
    }
}

//MARK: Hiding all Number expect last four
func customisedCardNumber(number: String)-> String {
    var newValue: String = ""
    let maxCount = number.count - 4
    
    number.enumerated().forEach { value in
        if value.offset < maxCount {
            let string = String(value.element)
            newValue.append(contentsOf: string)
            
        } else {
            let string = String(value.element)
            if string == " " {
                newValue.append(contentsOf: " ")
            } else {
                newValue.append(contentsOf: "*")
            }
        }
    }
    return newValue
}

//MARK: Detail View
struct DetailView: View {
    var currentCard: Card
    @Binding var showDetailCard: Bool
    //Matched Geometry Effect
    var animation: Namespace.ID
    
    //Delaying Expenses View
    @State var showExpenseView: Bool = false
    
    var body: some View {
        VStack {
            CardView()
                .matchedGeometryEffect(id: currentCard.id, in: animation)
                .frame(height: 200)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showExpenseView = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.easeInOut(duration: 0.35)) {
                            showDetailCard = false
                        }
                    }
                }
                .zIndex(10)
            GeometryReader { proxy in
                let height = proxy.size.height + 50
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        //Expenses
                        ForEach(expenses) { expense in
                            ExpenseCardView(expense: expense)
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(
                    Color.white
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .ignoresSafeArea()
                        .offset(y: showExpenseView ? 0 : height)
                )
            }
            .padding([.horizontal, .top])
            .zIndex(-10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.785))
        .onAppear {
            withAnimation(.easeInOut.delay(0.1)) {
                showExpenseView = true
            }
        }
    }
    @ViewBuilder
    func CardView()->some View {
        ZStack(alignment: .bottomLeading) {
            Image(currentCard.cardImage)
                .resizable()
                .aspectRatio(contentMode:.fit)
            VStack(alignment: .leading, spacing: 10) {
                Text(currentCard.name)
                    .fontWeight(.bold)
                Text(customisedCardNumber(number: currentCard.cardNumber))
                    .font(.callout)
                    .fontWeight(.bold)
            }
            .padding()
            .padding(.bottom, 10)
            .foregroundColor(.white)
        }
    }
}

struct ExpenseCardView: View {
    var expense: Expense
    //Displaying Expenses one by one Based on Index
    @State var showView: Bool = false
    var body: some View {
        HStack(spacing: 14) {
            Image(expense.productIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(expense.product)
                    .fontWeight(.bold)
                Text(expense.spendType)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 8) {
                Text(expense.amountSpent)
                    .fontWeight(.bold)
                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .opacity(showView ? 1 : 0)
        .onAppear {
            // Time Taken for To Show Up
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeInOut(duration:0.3).delay(Double(getIndex()) * 0.1)) {
                    showView = true
                }
            }
        }
    }
    func getIndex()->Int {
        return expenses.firstIndex { currentExpense in
            return expense.id == currentExpense.id
        } ?? 0
    }
}
