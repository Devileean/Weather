//
//  TestView.swift
//  Weather
//
//  Created by Алексей Логинов on 23.12.2021.
//

import UIKit

class TestView: UIView {
//MARK: Чтобы выполнить заливку прямоугольника размером 250x250, создадим наследника UIView и переопределим метод draw:

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.fill(CGRect(x: 0, y: 0, width: 50, height: 50))
    }
    
    //MARK: После этого можно создать экземпляр класса TestView. Зададим ему размер 100х100 и установим белый цвет фона:
   // let testView = TestView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
   // testView.backgroundColor = .white
}
