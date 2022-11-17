//
//  CalculatorModel.swift
//  Calculator
//
//  Created by DWL on 2022/11/17.
//

import Foundation
import Combine


class CalculatorModel:ObservableObject {
//    let objectWillChange = PassthroughSubject<Void,Never>()
//
//
//    var brain:CalculatorBrain = .left("0"){
//        willSet {
//            objectWillChange.send()
//        }
//    }
    
    @Published var brain:CalculatorBrain = .left("0")
    
    
    //为了实现回溯操作， 我们要将诶一步的操作记录下来 创建一个数组来记录
    @Published var history :[CalculatorButtonItem] = []
    
    //对按钮操作的时候来记录操作的
    func apply(_ item:CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
    }
    
    
    
}
