//
//  NewTransactionView.swift
//  Monefy
//
//  Created by Elvira Leveque on 13/12/21.
//

import SwiftUI

struct NewTransactionView: View {
    @Binding var showModal: Bool
    @State private var transactionType = "income"
    @State private var amount = ""
    @State private var selectedCategory = "housing"
    @Binding var transactions : [Transaction]
    
    var cat = ["housing", "transportation", "health", "entertainment", "personal care"]
    
    let transactionTypes = ["income", "expense"]
    var body: some View {
        NavigationView {
            VStack {
                Picker("Transaction type", selection: $transactionType) {
                    ForEach(transactionTypes, id: \.self) { transactionType in
                        Text(transactionType.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 250)
                
                Spacer()
                Form{
                    TextField("0", text: $amount)
                        .keyboardType(.decimalPad)
                        .font(.system(size: 50))
                        .foregroundColor(.black)
                    .multilineTextAlignment(.center)}
                
                Spacer()
                
                if transactionType == "expense" {
                    VStack {
                        Text("Cetegory")
                        Picker("Please choose a color", selection: $selectedCategory) {
                            ForEach(cat, id: \.self) { category in
                                Text(category.capitalized)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    
                    Spacer()
                }
                
                
                Button(action: {
                    transactions.insert(Transaction(amount: Double(amount) ?? 0, transactionType: transactionType, category: transactionType == "expense" ? selectedCategory : "income"), at: 0); showModal.toggle(); print(transactions[0].category)
                }, label: {
                    Text("Add")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background( Color.customGreen)
                        .opacity(amount == "" ? 0.5 : 1)
                        .cornerRadius(30)
                })
                    .disabled(amount == "")
            } //VStack
            .padding()
            .navigationTitle("New transaction")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Close", action: {
                showModal.toggle()
            }).foregroundColor(Color.customGreen))
            .navigationBarColor(backgroundColor: .none, titleColor: .black)
        } //Navigation
    }
}


struct NewTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransactionView(showModal: .constant(true), transactions: .constant([]))
    }
}
