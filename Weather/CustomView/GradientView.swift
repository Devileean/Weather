//
//  GradientView.swift
//  Weather
//
//  Created by Алексей Логинов on 23.12.2021.
//

import UIKit

@IBDesignable class GradientView: UIView {
////---------------------------------------------------------------------------------------------------
//   //MARK: Изменим класс слоя на CAGradientLayer. Для этого добавим следующий код в класс:
//
//    override static var layerClass: AnyClass {
//        return CAGradientLayer.self
//    }
////---------------------------------------------------------------------------------------------------
//    //MARK: Можно создать вычисляемую переменную для удобной работы со слоем:
//
//    var gradientLayer: CAGradientLayer {
//        return self.layer as! CAGradientLayer
//    }
////---------------------------------------------------------------------------------------------------
//    //MARK: Добавим свойства, отвечающие за параметры градиента:
//    // @IBInspectable отот кусочек кода добавляем для поддержки редактирования и визуализации view в storyboard:
//    @IBInspectable var startColor: UIColor = .white // Начальный цвет градиента
//    @IBInspectable var endColor: UIColor = .black // Конечный цвет градиента
//    @IBInspectable var startLocation: CGFloat = 0 // Начало градиента
//    @IBInspectable var endLocation: CGFloat = 1 // Конец градиента
//    @IBInspectable var startPoint: CGPoint = .zero // Точка начала градиента
//    @IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) // Точка конца градиента
////---------------------------------------------------------------------------------------------------
//    //MARK: Нужны методы, которые будут обновлять параметры слоя с градиентом:
//
//    func updateLocations() {
//        self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
//    }
//
//    func updateColors() {
//        self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
//    }
//
//    func updateStartPoint() {
//        self.gradientLayer.startPoint = startPoint
//    }
//
//    func updateEndPoint() {
//        self.gradientLayer.endPoint = endPoint
//    }
//    //MARK: Добавим вызов этих методов после изменения свойств, а также атрибуты @IBDesignable и @IBInspectable для поддержки редактирования и визуализации view в storyboard:
//
//
//}


@IBInspectable var startColor: UIColor = .white {
    didSet {
        self.updateColors()
    }
}
@IBInspectable var endColor: UIColor = .black {
    didSet {
        self.updateColors()
    }
}

@IBInspectable var startLocation: CGFloat = 0 {
    didSet {
        self.updateLocations()
    }
}
@IBInspectable var endLocation: CGFloat = 1 {
    didSet {
        self.updateLocations()
    }
}

@IBInspectable var startPoint: CGPoint = .zero {
    didSet {
        self.updateStartPoint()
    }
}
@IBInspectable var endPoint: CGPoint = CGPoint(x: 0, y: 1) {
    didSet {
        self.updateEndPoint()
    }
}

override static var layerClass: AnyClass {
    return CAGradientLayer.self
}

var gradientLayer: CAGradientLayer {
    return self.layer as! CAGradientLayer
}

func updateLocations() {
    self.gradientLayer.locations = [self.startLocation as NSNumber, self.endLocation as NSNumber]
}

func updateColors() {
    self.gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
}

func updateStartPoint() {
    self.gradientLayer.startPoint = startPoint
}

func updateEndPoint() {
    self.gradientLayer.endPoint = endPoint
}

}
