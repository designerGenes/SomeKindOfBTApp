//
//  ContentViewViewModel.swift
//  SomeKindOfBTApp
//
//  Created by Jaden Nation on 2/13/23.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
    @Published var isSearching: Bool = false
    @Published var connectedBTPeripherals: [UUID: BTPeripheral] = [UUID: BTPeripheral]()
    @Published var knownUnconnectedBTPeripherals: [UUID: BTPeripheral] = [UUID: BTPeripheral]()
    
    
    var searchButtonText: String {
        return isSearching ? "Searching" : "Search"
    }
    
    var searchButtonImage: String {
        return isSearching ? "ellipsis" : "magnifyingglass"
    }
}
