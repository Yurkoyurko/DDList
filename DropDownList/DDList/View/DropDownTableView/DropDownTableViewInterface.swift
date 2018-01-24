//
//  DropDownTableViewInterface.swift
//  DropDownTableView
//
//  Created by Sloyev iOS on 19.01.2018.
//  Copyright © 2018 YB. All rights reserved.
//

import UIKit

protocol DropDownTableViewInterface {
    func openItem(_ item: Int, animated: Bool)
    func closeItem(_ item: Int, animated: Bool)
    func isOpenSection(_ section: Int) -> Bool
    func reload()
}

