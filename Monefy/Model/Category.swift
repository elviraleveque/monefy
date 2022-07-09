//
//  Category.swift
//  Monefy
//
//  Created by Elvira Leveque on 15/12/21.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name : String
    let iconName : String
    let color : Color
}
