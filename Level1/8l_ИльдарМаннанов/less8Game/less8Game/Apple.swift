//
//  Apple.swift
//  less8Game
//
//  Created by Гюзель Маннанова on 10.12.2017.
//  Copyright © 2017 mif. All rights reserved.
//

import UIKit
import SpriteKit
// Яблоко
class Apple: SKShapeNode {
    //определяем, как оно будет отрисовываться
    convenience init(position: CGPoint) {
        self.init()
        // рисуем круг
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        // заливаем красным
        fillColor = UIColor.red
        // рамка тоже красная
        strokeColor = UIColor.red
        // ширина рамки 5 поинтов
        lineWidth = 5
        self.position = position
    }
}
