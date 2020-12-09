//
//  Network.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 04.12.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

import WebKit

class Network {
    let url = URL(string: "https://reqres.in/api/unknown/")!
    
    func getData() {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(ResponseREQRES.self, from: data!) {
                DataStore.shared.reqresColors.removeAll()
                for color in json.data {
                    let newColor = ReqresColor(id: UInt8(color.id), name: color.name, year: UInt16(color.year), code: color.color, pantone: color.pantone_value)
                    DataStore.shared.reqresColors.append(newColor)
                }
            }
        }.resume()
    }
    
}


