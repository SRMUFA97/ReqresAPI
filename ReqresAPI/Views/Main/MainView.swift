//
//  MainView.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 08.11.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            List(DataStore.shared.reqresColors) { reqresColor in
                VStack {
                    HStack {
                        Text("ID: \(reqresColor.id)")
                        Spacer()
                        VStack {
                            Text("\(reqresColor.name)")
                                .bold()
                            Text("\(String(reqresColor.year))")
                        }
                        Spacer()
                        VStack {
                            Text("\(reqresColor.code)")
                            Text("\(reqresColor.pantone)")
                        }
                        Spacer()
                        Circle()
                            .foregroundColor(.gray).frame(width: 32, height: 32, alignment: .center)
                    }
                }
            }
        .navigationBarTitle(Text("Colors from Reqres"))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
