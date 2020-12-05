//
//  MainView.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 08.11.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var data = DataStore.shared
    
    var body: some View {
        NavigationView {
            List(data.reqresColors) { reqresColor in
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
                            .foregroundColor(.gray).frame(width: 32, height: 32, alignment: .center)
                    }
                }
            }
            .navigationBarTitle(Text("Colors from Reqres"))
        }.onAppear(perform: getData)
    }
    
    func getData() {
        let network = Network()
        network.getData()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
