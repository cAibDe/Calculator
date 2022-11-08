//
//  ColorConfig.swift
//  Calculator
//
//  Created by 张鹏 on 2022/11/8.
//

import Foundation
import UIKit
import SwiftUI
extension UIColor {
    convenience init(light:UIColor,dark:UIColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light,.unspecified :
                return light
            case .dark :
                return dark;
            @unknown default :
                return light
            }
        }
    }
}
extension Color {
    // 定义一个颜色
    /// 计算器 按钮文字颜色
    static let calculatorTextColor = Color(light: .white, dark: .black)
    /// 计算器 按钮背景颜色
    static let calculatorButtonColor = Color(light: .black, dark: .white)

    init(light:Color,dark:Color) {
        self.init(UIColor(light: UIColor(light), dark: UIColor(dark)))
    }
}
