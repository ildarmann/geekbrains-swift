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
    
    var myFriends: [VkUser] = [VkUser(0, "Иванов Василий Петрович", UIImage(named: "01d")!),
                               VkUser(1, "Mr Y", UIImage(named: "01d")!),
                               VkUser(2, "Mr Z", UIImage(named: "01d")!)]
    var friendsFotos: [[String]] = [["01d", "01d", "01d"],
                                    ["01d", "01d"],
                                    ["01d"]]
    var myGroups: [VkGroup] = [VkGroup("Group 11"), VkGroup("Ku-ku group")]
    var otherGroups: [VkGroup] = [VkGroup("2 Group"), VkGroup("new X3"), VkGroup("toyota drivers")]
    
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
