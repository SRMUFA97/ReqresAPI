//
//  DataStore.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 18.11.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

final class DataStore {
    static let shared = DataStore()
    
    var reqresColors: [ReqresColor] = []
}
