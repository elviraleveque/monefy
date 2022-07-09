//
//  Transaction.swift
//  Monefy
//
//  Created by Elvira Leveque on 13/12/21.
//

import Foundation
import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let date = Date()
    var amount: Double
    var transactionType: String
    var category: String
//    @Binding var amount: String
//    @Binding var transactionType: String
//
//    internal init(amount: Double, transactionType: String) {
//        self.amount = amount
//        self.transactionType = transactionType
//    }
//
//    @Published var amount: Double
//    @Published var transactionType: String
    
}
