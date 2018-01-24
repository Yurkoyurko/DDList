//
//  DDListDDListInteractorOutput.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//

import Foundation

protocol DDListInteractorOutput: class {
    func didReceiveItems(_ items: [DDListItem])
    func didReceiveError(_ error: String)
}
