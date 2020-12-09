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
                Text("\(self.reqresColor.name)").font(.title).bold()
                Text("\(String(self.reqresColor.year))")
                Text("\(self.reqresColor.code)")
                Text("\(self.reqresColor.pantone)")
                Spacer()
            }
            Spacer()
        }.background(ColorCircle(color: Color(hex: self.reqresColor.code)))
    }
}

struct ColorCircle: View {
    let color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Circle().foregroundColor(.white).edgesIgnoringSafeArea(.all).frame(width: 200, height: 200, alignment: .center).overlay(Circle().stroke(Color.black, lineWidth: 5))
                Spacer()
            }
            Spacer()
            }.background(color).edgesIgnoringSafeArea(.all)
    }
}

struct OneColor_Previews: PreviewProvider {
    static var previews: some View {
        OneColor(reqresColor: ReqresColor(id: 4, name: "Test color", year: 2002, code: "#B4A1C5", pantone: "ssdsp"))
    }
}
