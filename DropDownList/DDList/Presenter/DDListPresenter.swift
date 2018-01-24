//
//  DDListDDListPresenter.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//
import UIKit

class DDListPresenter: DDListModuleInput, DDListViewOutput, DDListInteractorOutput {

    weak var view: DDListViewInput!
    var interactor: DDListInteractorInput!
    var router: DDListRouterInput!
    var items:[DDListItem] = []
    
    func viewIsReady() {
        self.view.setupInitialState()
        self.interactor.performAction(.load)
        self.view.startWaitingForResponse(true)
    }
    
    func didPullToRefresh() {
        self.interactor.performAction(.load)
    }
    
    func numberOfItems() -> Int {
        return self.items.count
    }
    
    func itemForIndex(index: Int) -> DDListItem {
        return self.items[index]
    }
    
    
    
    
    //MARK: - Interactor output
    func didReceiveItems(_ items: [DDListItem]) {
        self.items = items
        self.view.displayDDList(items)
        self.view.endRefreshing()
        self.view.startWaitingForResponse(false)
    }
    
    func didReceiveError(_ error: String) {
        self.view.showError(error)
        self.view.endRefreshing()
        self.view.startWaitingForResponse(false)
    }
}
