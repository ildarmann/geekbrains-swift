//
//  Friend.swift
//  vkclient
//
//  Created by Ильдар on 02.05.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import Foundation
import UIKit

class VkUser {
    var id: Int
    var name: String
    var foto: UIImage
    
    init(_ id: Int, _ name: String, _ foto: UIImage) {
        self.id = id
        self.name = name
        self.foto = foto
    }
    
    
}
