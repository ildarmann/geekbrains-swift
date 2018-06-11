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
    
    private static var myGroups: [VkGroup] = [VkGroup(0, "Group 11", UIImage(named: "01d")!, 2),
                                       VkGroup(1, "Ku-ku group", UIImage(named: "01d")!, 2)
    ]
    private static  var otherGroups: [VkGroup] = [VkGroup(10, "2 Group", UIImage(named: "01d")!, 101),
                                          VkGroup(11, "new X3", UIImage(named: "01d")!, 24),
                                          VkGroup(12, "toyota drivers", UIImage(named: "01d")!, 222)
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
    
    static func getMyGroups() -> [VkGroup] {
        return myGroups
    }
    
    static func addToMyGroups(_ newGroupID: Int) {
        //проверка на наличие уже этой группы в списке
        let index = otherGroups.index(where: {$0.id == newGroupID})
        let newGroup = otherGroups.remove(at: index!)
        myGroups.append(newGroup)
    }
    
    static func deleteFromMyGroupList(_ groupID: Int) {
        let index = myGroups.index(where: {$0.id == groupID})
        let deletedGroup = myGroups.remove(at: index!)
        otherGroups.append(deletedGroup)
    }
    
    static func getOtherGroups() -> [VkGroup] {
        return otherGroups
    }

}
