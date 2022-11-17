//
//  ContentView.swift
//  Calculator
//
//  Created by 张鹏 on 2022/11/7.
//
/*@State
  修饰的值在SwiftUI内部会自动被转换为一对setter&getter，对这个属性进行 赋值操作的时候会触发View的刷新，它的body会被再次调用，底层的渲染引擎会找出界面上被改变的部分，根据新的属性值计算出新的View，并进行刷新
 */
/*@Binding
  也是对属性的修饰，它做的事情是将值语义的属性“转换”为引用语义。对被声明为\@Binding的属性进行赋值，改变的将不是属性本身，而是它的引用，这个改变将被向外传递
 */

import SwiftUI
import Combine


struct ContentView: View {
    let scale:CGFloat = UIScreen.main.bounds.width / 414
    
//    @State private var brain : CalculatorBrain = .left("0")
    @ObservedObject  var model = CalculatorModel()
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作履历\(model.history.count)"){
                print(self.model.history)
            }
            Text(model.brain.output)//1.修改Text的数值
                .font(.system(size: 76))
                .foregroundColor(.calculatorButtonColor)
                .minimumScaleFactor(0.5)
                .padding(.trailing,24)
                .lineLimit(1)
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       alignment: .trailing)
//            CalculatorButtonPad(brain: $model.brain).padding(.bottom)
            CalculatorButtonPad(model: model).padding(.bottom)
        }
    }
}
/// 纵向按钮集合抽象
struct CalculatorButtonPad :View {
    
    let pad:[[CalculatorButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [.digit(4),.digit(5),.digit(6),.op(.minus)],
        [.digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
//    @Binding var brain :CalculatorBrain
    var model:CalculatorModel
    var body: some View {
        VStack(spacing: 8) {
            ForEach(pad, id: \.self) {
                row in
//                CalculatorButtonRow(row: row,brain: self.$brain)
                CalculatorButtonRow(row: row, model: self.model)
            }
        }
    }
}

/// 一行按钮的抽象集合
struct CalculatorButtonRow: View {
    let row:[CalculatorButtonItem]
//    @Binding var brain :CalculatorBrain
    var model:CalculatorModel
    var body: some View {
        HStack{
            ForEach(row,id: \.self) { item in
                CalculatorButton (title: item.title, size: item.size, backgroundClolor: item.backgroundColor) {
//                    self.brain = self.brain.apply(item: item)
                    self.model.apply(item)
                }
            }
        }
    }
}

///按钮抽象化
struct CalculatorButton: View {
    
    let fontSIze:CGFloat = 38
    let title:String
    let size:CGSize
    let backgroundClolor:Color
    let action:()->Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSIze))
                .foregroundColor(.calculatorTextColor)
                .frame(width: size.width,height: size.height)
                .background(backgroundClolor)
                .cornerRadius(size.width/2)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
