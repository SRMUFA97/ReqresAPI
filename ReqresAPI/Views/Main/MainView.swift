//
//  MainView.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 08.11.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

import SwiftUI
import WebKit

struct MainView: View {
    @State var data: [ReqresColor] = []
    
    var body: some View {
        NavigationView {
            List(data) { reqresColor in
                NavigationLink(destination: OneColor(reqresColor: reqresColor)) {
                    VStack {
                        HStack {
                            Text("ID: \(reqresColor.id)")
                            Spacer()
                            Spacer()
                            VStack(alignment: .center) {
                                Text("\(reqresColor.name)").fontWeight(.bold).multilineTextAlignment(.center)
                                Text("\(String(reqresColor.year))")
                            }
                            Spacer()
                            Spacer()
                            VStack {
                                Text("\(reqresColor.code)")
                                Text("\(reqresColor.pantone)")
                            }
                            Circle()
                                .foregroundColor(Color(hex: reqresColor.code)).frame(width: 32, height: 32, alignment: .center)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Colors from Reqres"))
        }.onAppear(perform: getData)
    }
    
    func getData() {
        let url = URL(string: "https://reqres.in/api/unknown/")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(ResponseREQRES.self, from: data!) {
                for color in json.data {
                    let newColor = ReqresColor(id: UInt8(color.id), name: color.name, year: UInt16(color.year), code: color.color, pantone: color.pantone_value)
                    
                    DispatchQueue.main.async {
                        self.data.append(newColor)
                    }
                }
            }
        }.resume()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
