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
    let oc = OneColor()
    
    var body: some View {
        NavigationView {
            List(data.reqresColors) { reqresColor in
                NavigationLink(destination: self.oc) {
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
                                .foregroundColor(self.colorConvert(hex: reqresColor.code)).frame(width: 32, height: 32, alignment: .center)
                        }
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
    
    func colorConvert(hex: String) -> Color {
        var newHEX = hex
        newHEX.removeFirst()
        let red: Double = {
            let index = newHEX.index(newHEX.startIndex, offsetBy: 2)
            let hexRed = newHEX[..<index]
            newHEX.removeFirst(2)
            return hexToDec(hex: hexRed)
        }()
        let green: Double = {
            let index = newHEX.index(newHEX.startIndex, offsetBy: 2)
            let hexGreen = newHEX[..<index]
            newHEX.removeFirst(2)
            return hexToDec(hex: hexGreen)
        }()
        let blue: Double = {
            let index = newHEX.index(newHEX.startIndex, offsetBy: 2)
            let hexBlue = newHEX[..<index]
            newHEX.removeFirst(2)
            return hexToDec(hex: hexBlue)
        }()
        let color = Color(red: red/255, green: green/255, blue: blue/255)
        return color
    }
    
    func hexToDec(hex: String.SubSequence) -> Double {
        var sum: Double = 0
        if hex.first!.isNumber {
            sum += Double(String(hex.first!))! * 16
        } else {
            switch hex.first {
            case "A":
                sum += 10 * 16
            case "B":
                sum += 11 * 16
            case "C":
                sum += 12 * 16
            case "D":
                sum += 13 * 16
            case "E":
                sum += 14 * 16
            case "F":
                sum += 15 * 16
            default:
                break
            }
        }
        if hex.last!.isNumber {
            sum += Double(String(hex.last!))! * 1
        } else {
            switch hex.last {
            case "A":
                sum += 10 * 1
            case "B":
                sum += 11 * 1
            case "C":
                sum += 12 * 1
            case "D":
                sum += 13 * 1
            case "E":
                sum += 14 * 1
            case "F":
                sum += 15 * 1
            default:
                break
            }
        }
        return sum
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
