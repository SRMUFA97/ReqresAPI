//
//  ColorExtension.swift
//  ReqresAPI
//
//  Created by Shamil Rakhimov on 09.12.2020.
//  Copyright © 2020 Shamil Rakhimov. All rights reserved.
//

import SwiftUI

extension Color {
    init(hex: String) {
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
        
        self = colorConvert(hex: hex)
    }
}


