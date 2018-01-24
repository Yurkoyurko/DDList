//
//  DDListItem.swift
//  DropDownList
//
//  Created by Elon Musk on 1/20/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

protocol DDListItem: class {
    var id : NSNumber { get set }
    var title : String { get set }
    var imageURL:String? { get set }
    var subitems : [DDListSubitem] { get set }
    
    init(id:NSNumber, title:String, imageURL: String, subitems:[DDListSubitem])
}
