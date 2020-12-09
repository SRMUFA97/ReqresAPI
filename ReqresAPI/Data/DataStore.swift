//
//  DataStore.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 18.11.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

import SwiftUI

final class DataStore: ObservableObject {
    static let shared = DataStore()
    
    @Published var reqresColors: [ReqresColor] = []
}
