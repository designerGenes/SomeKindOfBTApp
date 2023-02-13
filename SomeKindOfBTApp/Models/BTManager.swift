//
//  BTManager.swift
//  SomeKindOfBTApp
//
//  Created by Jaden Nation on 2/12/23.
//

import Foundation
import CoreBluetooth

class BTManager: NSObject, CBCentralManagerDelegate, ObservableObject {
    @Published var entities = [UUID: BTPeripheral]()
    @Published var connections = [UUID: Int]() // 1 == connected
    
    @Published var isScanning: Bool = false
    private var centralManager: CBCentralManager!
    
    
    // MARK: - CBCentralManagerDelegate methods
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            break
        case .poweredOff:
            break
        case .resetting:
            break
        case .unauthorized:
            break
        case .unsupported:
            break
        case .unknown:
            break
        @unknown default:
            break
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // add to list of connected peripherals
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        // remove from list
    }
    
    private func didSetScanning(_ isScanning: Bool) {
        if isScanning {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        } else {
            centralManager.stopScan()
        }
    }
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
}

extension BTManager {
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let name = peripheral.name else {
            return
        }
        entities[peripheral.identifier] = BTPeripheral(name: name, id: peripheral.identifier)
    }
}

