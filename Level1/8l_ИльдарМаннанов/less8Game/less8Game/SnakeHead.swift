//
//  SnakeHead.swift
//  less8Game
//
//  Created by Гюзель Маннанова on 10.12.2017.
//  Copyright © 2017 mif. All rights reserved.
//

import UIKit
class SnakeHead: SnakeBodyPart {
    override init(atPoint point: CGPoint){
        super.init(atPoint:point)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
