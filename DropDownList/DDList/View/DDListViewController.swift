//
//  DDListDDListViewController.swift
//  DropDownList
//
//  Created by YB on 20/01/2018.
//  Copyright © 2018 YB. All rights reserved.
//

import UIKit
import SVProgressHUD


class DDListViewController: UIViewController, DDListViewInput {
    

    var output: DDListViewOutput!
    var dropDownListView: DropDownTableView!
    var refreshControl:UIRefreshControl = UIRefreshControl()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    
    // MARK: DDListViewInput
    func setupInitialState() {
        self.title = "Drop Down List"
        
        self.dropDownListView = DropDownTableView(frame: self.view.bounds, style: .plain)
        self.view.addSubview(self.dropDownListView)
        self.dropDownListView.dropDownDelegate = self
        self.dropDownListView.dropDownDataSource = self
        
        self.dropDownListView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: self.dropDownListView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: self.dropDownListView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: self.dropDownListView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: self.dropDownListView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0).isActive = true
        
        
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    func showError(_ error:String) {
        SVProgressHUD.showError(withStatus: error)
    }
    
    func startWaitingForResponse(_ isStart: Bool) {
        if isStart {
            SVProgressHUD.show(withStatus: "Loading...")
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    func displayDDList(_ items: [DDListItem]) {
        self.dropDownListView.items = items
        self.dropDownListView.reload()
    }
    
    @objc func refresh() {
        self.output.didPullToRefresh()
    }
    
    func endRefreshing() {
        self.refreshControl.endRefreshing()
    }

}

extension DDListViewController: DropDownTableViewDataSource {
    
    func numberOfItems() -> Int {
        return self.output.numberOfItems()
    }
    
    func itemForIndex(index: Int) -> DDListItem {
        return self.output.itemForIndex(index: index)
    }
    
    func subitemsForIndex(index: Int) -> [DDListSubitem] {
         return self.output.itemForIndex(index: index).subitems
    }
    
    func disclosureIndicatorImageForItem(index: Int) -> UIImage? {
        return UIImage(named: "arrow-point-to-right")
    }
    
    func heightForItem(index: Int) -> CGFloat {
        return 80.0
    }
    
    func subitemHeight(_ subItem:Int) -> CGFloat {
        return 44.0
    }
    
    func footerHeight() -> CGFloat {
        return 0.0
    }
}

extension DDListViewController: DropDownTableViewDelegate {
    
    func didSelectSubitem(_ item: DDListSubitem) {
         print("did open subitem :\(item.title)")
    }

    func didOpenItem(_ item: DDListItem, at: Int) {
        print("did open item :\(item.title)")
    }
}
