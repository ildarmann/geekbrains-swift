//
//  VkDataProvider.swift
//  vkclient
//
//  Created by Ильдар on 02.05.2018.
//  Copyright © 2018 mif. All rights reserved.
//

import Foundation
import UIKit

class VkDataProvider {
    
    private var myFriends: [VkUser] = [VkUser(0, "Иванов Василий Петрович", UIImage(named: "01d")!),
                               VkUser(1, "Mr Y", UIImage(named: "01d")!),
                               VkUser(2, "Mr Z", UIImage(named: "01d")!)]
    private var friendsFotos: [[String]] = [["01d", "01d", "01d"],
                                    ["01d", "01d"],
                                    ["01d"]]
    
    private var myGroups: [VkGroup] = [VkGroup(0, "Group 11", UIImage(named: "01d")!, 2),
                                       VkGroup(1, "Ku-ku group", UIImage(named: "01d")!, 2)
    ]
    private var otherGroups: [VkGroup] = [VkGroup(0, "2 Group", UIImage(named: "01d")!, 101),
                                          VkGroup(1, "new X3", UIImage(named: "01d")!, 24),
                                          VkGroup(2, "toyota drivers", UIImage(named: "01d")!, 222)
    ]

    // -----------
    
    
    
    func getMyFriends() -> [VkUser]{
        return myFriends
    }
    
    func getFriendFotos(_ id: Int) -> [UIImage] {
        var result: [UIImage] = []
        
        for friendFoto in friendsFotos[id] {
            result.append(UIImage(named: friendFoto)!)
        }
        return result
        
    }
    
    func getMyGroups() -> [VkGroup] {
        let result: [VkGroup] = myGroups
        return result

    }
    
    func getOtherGroups() -> [VkGroup] {
        let result: [VkGroup] = otherGroups
        return result
        
    }

}
