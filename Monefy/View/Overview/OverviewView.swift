//
//  ContentView.swift
//  Monefy
//
//  Created by Elvira Leveque on 10/12/21.
//

import SwiftUI

struct OverviewView: View {
    
    @State private var showModal = false
    @State var transactions : [Transaction] = []
    
    var incomes : Double {
        var n : Double = 0
        for transaction in transactions {
            if transaction.transactionType == "income" {
                n += transaction.amount
            }
        }
        return n
    }

    var expenses : Double {
        var n : Double = 0
        for transaction in transactions {
            if transaction.transactionType == "expense" {
                n += transaction.amount
            }
        }
        return n
    }
    
    var body: some View {
        NavigationView {
            VStack (spacing:0){
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Text("December")
                        .font(.headline)
                        .foregroundColor(Color.customGreen)
                    Spacer()
                    Image(systemName: "chevron.right")
                } //Hstack Month
                .foregroundColor(Color(.systemGray2))
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.white))
                .cornerRadius(30)
                .padding(.horizontal)
                
                Spacer()
                
                PieChartView(names: ["expenses", "incomes"], values: [expenses, incomes], colors: [Color.customRed, Color.customGreen], innerRadiusFraction: 0.7, backgroundColor: Color(.systemGray6))
                    .padding()
                    .frame(minHeight: 300)
                
                Spacer()
                
                List {
                    Section(header: HStack {
                        Text("Transactions")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                        NavigationLink {
                            TransactionsView(transactions: $transactions)
                        } label: {
                            HStack {
                                Text("Show all")
                                    .fontWeight(.regular)
                                    
                                Image(systemName: "chevron.right")
                            }
                            .foregroundColor(.customGreen)
                        }
                    }
                                .textCase(nil)
                    )//Header
                    {
                        if transactions.count == 0 {
                            Text("No transaction yet").foregroundColor(Color(.systemGray))
                        } else if transactions.count > 2 {
                            ForEach(0..<3) { i in
                                OverviewListRow(transaction: transactions[i])
                            }
                        } else {
                            ForEach(transactions) { transaction in
                                OverviewListRow(transaction: transaction)
                            }
                        }
                    }
                } //List
                .listStyle(.insetGrouped)
                
                Button(action: {
                    showModal.toggle()
                }, label: {
                    Text("New transaction")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.customGreen)
                        .cornerRadius(30)
                        .padding(.horizontal)
                }).sheet(isPresented: $showModal, content: {
                    NewTransactionView(showModal: $showModal, transactions: $transactions)
                })
                
            } //Vstack
            .padding(.vertical)
            .navigationBarColor(backgroundColor: UIColor(Color.customGreen), titleColor: .white)
            .navigationTitle("Overview")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGray6).edgesIgnoringSafeArea(.bottom).edgesIgnoringSafeArea(.top))
        }
        .accentColor(.white)//Navigation view
    }
}




struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
