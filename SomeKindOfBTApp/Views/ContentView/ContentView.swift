//
//  ContentView.swift
//  SomeKindOfBTApp
//
//  Created by Jaden Nation on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        VStack {
            List(Array(viewModel.connectedBTPeripherals.values)) { entity in
                BTEntityCell(entity: entity)
            }
            .cornerRadius(15)
            
            Rectangle()
                .frame(height: 20)
                .hoverEffect(.lift)
                .cornerRadius(5)
                .foregroundColor(.gray).opacity(0.5)
            List(Array(viewModel.knownUnconnectedBTPeripherals.values)) { entity in
                BTEntityCell(entity: entity)
            }
            .cornerRadius(5)
            Spacer()
            
            Button(action: {
                viewModel.isSearching = !viewModel.isSearching
            }) {
                HStack {
                    Image(systemName: viewModel.searchButtonImage)
                    Text(viewModel.searchButtonText)
                }
                .foregroundColor(.blue)
            }
            
        }
        .navigationTitle("Bluetoothconnections")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let btEntities = [
        BTPeripheral(name: "NRF 91"),
        BTPeripheral(name: "BT Thingy"),
        BTPeripheral(name: "AdaFruit 201"),
    ]
    
    static let btConnectedEntities = [
        BTPeripheral(name: "Furbo")
    ]
    
    static var viewModel: ContentViewViewModel {
        let out = ContentViewViewModel()
        out.knownUnconnectedBTPeripherals = {
            var knownUnconnected = [UUID: BTPeripheral]()
            for btPeripheral in btEntities {
                knownUnconnected[btPeripheral.id] = btPeripheral
            }
            return knownUnconnected
        }()
        
        out.connectedBTPeripherals = {
            var connected = [UUID: BTPeripheral]()
            for btPeripheral in btConnectedEntities {
                connected[btPeripheral.id] = btPeripheral
            }
            return connected
        }()
        
        return out
    }
    
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
