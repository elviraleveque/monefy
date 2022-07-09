//
//  PieChartView.swift
//  Monefy
//
//  Created by Elvira Leveque on 11/12/21.
//

import SwiftUI

struct Box: View {
    let name: String
    let money: Double
    
    var body: some View {
        VStack {
            Text("€ \(String(money).uppercased())")
                .font(.title2)
                .fontWeight(.bold)
            Text(name.uppercased())
                .font(.caption)
        }
        .padding()
        .fixedSize(horizontal: true, vertical: false)
        .frame(maxWidth: .infinity)
        .background(name == "incomes" ? Color.customGreen : Color.customRed)
        .cornerRadius(15)
        .foregroundColor(.white)
    }
}

struct PieChartView: View {
    public let names: [String]
    public let values: [Double]
    public var colors: [Color]
    public var innerRadiusFraction: CGFloat
    
    public var backgroundColor: Color
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(name: self.names[i], startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 25){
                HStack{
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(Color(.systemGray4))
                            .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                        ForEach(0..<self.values.count){ i in
                            PieSliceView(pieSliceData: self.slices[i])
                        }
                        .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                        
                        Circle()
                            .fill(self.backgroundColor)
                            .frame(width: geometry.size.width/2 * innerRadiusFraction, height: geometry.size.width/2 * innerRadiusFraction)
                        
                        VStack {
                            Text("€ \(String(values[1] - values[0]))")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor( values[1] - values[0] >= 0 ? Color.customGreen : Color.customRed)
                            Text("Balance".uppercased())
                                .font(.caption)
                        }
                    }
                    Spacer()
                }
                HStack (spacing: 20){
                    Box(name: "incomes", money: values[1])
                    Spacer()
                    Box(name: "expenses", money: values[0])
                }
            }
            .background(self.backgroundColor)
            .foregroundColor(Color.black)
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(names: ["expenses", "incomes"], values: [0, 0], colors: [Color.customRed, Color.customGreen], innerRadiusFraction: 0.6, backgroundColor: Color(.systemGray6))
    }
}
