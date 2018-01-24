//
//  DDListDDListInteractor.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//

enum DDListAction {
    case load
}

class DDListInteractor: DDListInteractorInput {

    weak var output: DDListInteractorOutput!
    var httpManager: DDListHTTPDataManager!
    
    func performAction(_ action: DDListAction) {
        switch action {
        case .load:
            self.load()
            print("load")
        }
    }
    
}

extension DDListInteractor {
    
    private func loadRandom() {
        let items = DDListItemsFactory.produceRandomItems(count: 10)
        self.output.didReceiveItems(items)
    }
    
    private func load() {
        self.httpManager.performTask(.fetchList) { (result, error) in
            if error != nil {
                self.output.didReceiveError(error!)
            } else {
                let items = DDListItemsFactory.produceItems(with: result)
                self.output.didReceiveItems(items)
            }
        }
        
    }
}
