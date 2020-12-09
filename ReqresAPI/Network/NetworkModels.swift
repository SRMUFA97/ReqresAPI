//
//  NetworkModels.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 04.12.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

struct ResponseREQRES: Codable {
    var page: Int
    var per_page: Int
    var total: Int
    var total_pages: Int
    var data: [DataREQRES]
}

struct DataREQRES: Codable {
    var id: Int
    var name: String
    var year: Int
    var color: String
    var pantone_value: String
}
