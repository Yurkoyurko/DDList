//
//  DDListDDListInitializer.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//

import UIKit

class DDListModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var ddlistViewController: DDListViewController!

    override func awakeFromNib() {

        let configurator = DDListModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: ddlistViewController)
    }

}
