//
//  DDListDDListViewInput.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//

protocol DDListViewInput: class {

    /**
        @author YB
        Setup initial state of the view
    */

    func setupInitialState()
    func showError(_ error:String)
    func startWaitingForResponse(_ isStart: Bool)
    func displayDDList(_ items: [DDListItem])
    func endRefreshing()
}
