//
//  ItemModel.swift
//  DropDownList
//
//  Created by Elon Musk on 1/20/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

class ItemModel: NSObject, DDListItem {
    
    var id: NSNumber
    var title: String
    var imageURL:String?
    var subitems: [DDListSubitem]
    
    required init(id:NSNumber, title:String, imageURL: String, subitems:[DDListSubitem]) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.subitems = subitems
    }

    
}
