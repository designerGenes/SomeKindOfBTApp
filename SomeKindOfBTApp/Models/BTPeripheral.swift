//
//  BTPeripheral.swift
//  SomeKindOfBTApp
//
//  Created by Jaden Nation on 2/12/23.
//

import Foundation
import CoreBluetooth

struct BTPeripheral: Identifiable {
    var name: String
    var id: UUID = UUID()
    
    static func fromCBPeripheral(_ peripheral: CBPeripheral) -> Self? {
        guard let name = peripheral.name else {
            return nil
        }
        return BTPeripheral(name: name, id: peripheral.identifier)
    }
}
