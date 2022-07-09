//
//  OverviewListRow.swift
//  Monefy
//
//  Created by Elvira Leveque on 14/12/21.
//

import SwiftUI

struct OverviewListRow: View {
    var transaction: Transaction
    var body: some View {
        HStack{
            HStack {
                ForEach(categories) {category in
                    if transaction.category == category.name {
                        Image(systemName: category.iconName).foregroundColor(category.color)
                            .frame(width:30)
                    }
                }
                Text(transaction.category.capitalized)
            }
            Spacer()
            Text("€ \(String(transaction.transactionType == "income" ? transaction.amount : transaction.amount * -1))")
                .foregroundColor(transaction.transactionType == "income" ? Color.customGreen : Color.customRed)
                .fontWeight(.bold)
        }
    }
}

struct OverviewListRow_Previews: PreviewProvider {
    static var previews: some View {
        OverviewListRow(transaction: Transaction(amount: 200, transactionType: "expense", category: "housing"))
    }
}
