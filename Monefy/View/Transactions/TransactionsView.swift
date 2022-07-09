//
//  TransactionsView.swift
//  Monefy
//
//  Created by Elvira Leveque on 12/12/21.
//

import SwiftUI

struct TransactionsView: View {
    @Binding var transactions: [Transaction]
    var body: some View {
        VStack {
            if transactions.count == 0 {
                Text("Empty")
                    .padding()
            } else {
                List (transactions) { transaction in
                    OverviewListRow(transaction: transaction)
                }
            }
            Spacer()
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(transactions: .constant([]))
    }
}
