//
//  OneColor.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 08.12.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

import SwiftUI

struct OneColor: View {
    var reqresColor: ReqresColor
    
    init(reqresColor: ReqresColor) {
        self.reqresColor = reqresColor
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text("\(self.reqresColor.name)").bold()
                Text("\(String(self.reqresColor.year))")
                Text("\(self.reqresColor.code)")
                Text("\(self.reqresColor.pantone)")
                Spacer()
            }
            Spacer()
        }.background(Color(hex: self.reqresColor.code)).edgesIgnoringSafeArea(.all)
        
    }
}

struct OneColor_Previews: PreviewProvider {
    static var previews: some View {
        OneColor(reqresColor: ReqresColor(id: 4, name: "Test color", year: 2002, code: "#201010", pantone: "ssdsp"))
    }
}
