//
//  DDListDDListConfigurator.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//

import UIKit

class DDListModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DDListViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DDListViewController) {

        let router = DDListRouter()

        let presenter = DDListPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DDListInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        interactor.httpManager = DDListHTTPDataManager(urls: [DataManagerTasks.fetchList:"https://e97b7234-fde2-4f99-8414-b368658a363b.mock.pstmn.io/list"])
    }

}
