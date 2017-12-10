//
//  Snake.swift
//  less8Game
//
//  Created by Гюзель Маннанова on 10.12.2017.
//  Copyright © 2017 mif. All rights reserved.
//

import UIKit
import SpriteKit
// сама змейка
class Snake: SKShapeNode {
    // массив где хранятся сегменты тела
    var body = [SnakeBodyPart]()
    // конструктор
    convenience init(atPoint point: CGPoint) {
        self.init()
        // змейка начинается с головы, создадим ее
        let head = SnakeHead(atPoint: point)
        // и добавим в массив
        body.append(head)
        // и сделаем ее дочерним объектом.
        addChild(head)
    }
    // метод добавляет еще один сегмент тела
    func addBodyPart(){
        // инстанцируем сегмент
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        // добавляем его в массив
        body.append(newBodyPart)
        // делаем дочерним объектом
        addChild(newBodyPart)
    }
}
