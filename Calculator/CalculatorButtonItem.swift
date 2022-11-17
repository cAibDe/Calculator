//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by 张鹏 on 2022/11/7.
//

import Foundation
import SwiftUI
enum CalculatorButtonItem{
    enum Op:String{
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    enum Command:String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Op)
    case command(Command)
}

extension CalculatorButtonItem:Hashable {
    var title :String{
        switch self {
        case .digit(let value) : return String(value)
        case .dot : return "."
        case .op(let op) :return op.rawValue
        case .command(let command) :return command.rawValue
        }
    }
    
    var size : CGSize {
        let itemWidth = (UIScreen.main.bounds.size.width - 40) / 4
        if case .digit(let value) = self ,value == 0 {
          return  CGSize(width: itemWidth * 2 + 8, height: itemWidth)
        }
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    var backgroundColor : Color {
        switch self {
        case .digit,.dot : return Color.calculatorButtonColor
        case .op : return Color.orange
        case .command:return Color.purple
        }
    }
}
