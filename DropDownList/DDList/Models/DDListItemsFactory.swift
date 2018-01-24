//
//  DDListItemsFactory.swift
//  DropDownList
//
//  Created by Elon Musk on 1/20/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

class DDListItemsFactory: NSObject {
    
    class func produceItems(with data:[[String:Any]]) -> [DDListItem] {
        var createdItems:[DDListItem] = []
        
        for item in data {
            var createdSubItems:[DDListSubitem] = []
            let subitems = item["children"] as! [[String:Any]]
            
            for subitem in subitems {
                let createdSubitem = SubitemModel(id: subitem["id"] as! NSNumber, title: subitem["name"] as! String, imageURL:"")
                createdSubItems.append(createdSubitem)
            }
            let item = ItemModel(id: item["id"] as! NSNumber, title: item["name"] as! String, imageURL:"", subitems: createdSubItems)
            createdItems.append(item)
        }
        print(createdItems)
        return createdItems
    }
    
    class func produceRandomItems(count: Int) -> [DDListItem] {
        var randomItems:[DDListItem] = []
        for i in 0..<count {
            let subitem = SubitemModel(id:NSNumber(value: i), title: "Subitem \(i)", imageURL: "")
            let item = ItemModel(id:NSNumber(value: i), title: "Item \(i)", imageURL: "", subitems: [subitem])
            randomItems.append(item)
        }
        return randomItems
    }
}
