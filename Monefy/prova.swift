////
////  prova.swift
////  Monefy
////
////  Created by Elvira Leveque on 14/12/21.
////
//
//import SwiftUI
//
//struct prova: View {
//    @State private var transactionType = "income"
//    @State private var amount = ""
//    @State var incomes : [Transaction]
//    @State var expenses : [Transaction]
//    let transactionTypes = ["income", "expense"]
//    var body: some View {
//        NavigationView {
//            VStack {
//                Picker("What is your favorite color?", selection: $transactionType) {
//                    ForEach(transactionTypes, id: \.self) { transactionType in
//                        Text(transactionType.capitalized)
//                    }
//                }
//                .pickerStyle(.segmented)
//                .frame(width: 250)
//                
//                Spacer()
//                
//                TextField("0", text: $amount)
//                    .keyboardType(.decimalPad)
//                    .font(.system(size: 50))
//                    .foregroundColor(.black)
//                    .multilineTextAlignment(.center)
//                
//                Spacer()
//                
//                Text(" \(String(incomes[0].amount)) \(incomes[0].transactionType)").foregroundColor(Color(.blue))
//                Text(" \(String(expenses[0].amount)) \(expenses[0].transactionType)").foregroundColor(Color(.red))
//                
//                Button(action: {
//                    transactionType == "income" ? incomes.insert(Transaction(amount: Double(amount) ?? 0, transactionType: transactionType), at: 0) : expenses.insert(Transaction(amount: Double(amount) ?? 0, transactionType: transactionType), at: 0)
//                }, label: {
//                    Text("Add")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.customGreen)
//                        .cornerRadius(30)
//                })
//            } //VStack
//            .padding()
//            .navigationTitle("New transaction")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarColor(backgroundColor: .none, titleColor: .black)
//        } //Navigation
//    }
//}
//
//
//struct prova_Previews: PreviewProvider {
//    static var previews: some View {
//        prova(incomes: [Transaction(amount: 0, transactionType: "income")], expenses: [Transaction(amount: 0, transactionType: "expense")])
//    }
//}
