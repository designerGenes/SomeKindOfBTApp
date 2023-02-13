//
//  BTEntityCell.swift
//  SomeKindOfBTApp
//
//  Created by Jaden Nation on 2/11/23.
//

import SwiftUI

struct BTEntityCell: View {
    var entity: BTPeripheral
    var body: some View {
        HStack {
            Text(entity.name)
            Spacer()
            //            if entity.signalStrength > 0 {
            Image(systemName: "cellularbars")
            //            } else {
            //                Image(systemName: "chart.bar")
            //            }
            
        }
        .padding()
        .frame(height: 50)
    }
}

struct BTEntityCell_Previews: PreviewProvider {
    static var previews: some View {
        BTEntityCell(entity: BTPeripheral(name: "NRF 91", id: UUID()))
    }
}
