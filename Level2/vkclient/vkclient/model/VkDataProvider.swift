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
    
    var myFriends: [VkUser] = [VkUser("Иванов Василий Петрович"), VkUser("Mr Y"), VkUser("Mr Z")]
    var myGroups: [VkGroup] = [VkGroup("Group 11"), VkGroup("Ku-ku group")]
    var otherGroups: [VkGroup] = [VkGroup("2 Group"), VkGroup("new X3"), VkGroup("toyota drivers")]
    
    func getMyFriends() -> [VkUser]{
        return myFriends
    }
    
    func getFriendFotos() -> [UIImage] {
        var result: [UIImage] = []
        for _ in myFriends {
            result.append(UIImage(named: "01d")!)
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
