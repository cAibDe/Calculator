//
//  Reducer.swift
//  Calculator
//
//  Created by DWL on 2022/11/17.
//

import Foundation
typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButtonItem

struct Reducer {
    static func reduce(state:CalculatorState,action:CalculatorStateAction) -> CalculatorState {
        return state.apply(item: action)
    }
}
