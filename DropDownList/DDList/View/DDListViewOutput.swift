//
//  DDListDDListViewOutput.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//
import UIKit

protocol DDListViewOutput {

    /**
        @author YB
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func numberOfItems() -> Int
    func itemForIndex(index: Int) -> DDListItem
    
    func didPullToRefresh()
}
