//
//  SubitemModel.swift
//  DropDownList
//
//  Created by Elon Musk on 1/21/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

class SubitemModel: NSObject, DDListSubitem {
    
    var id: NSNumber
    var title: String
    var imageURL: String?
    
    required init(id: NSNumber, title: String, imageURL: String) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
    
}
