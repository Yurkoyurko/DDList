//
//  DropDownTableView.swift
//  DropDownTableView
//
//  Created by Sloyev iOS on 19.01.2018.
//  Copyright © 2018 YB. All rights reserved.
//

import UIKit

protocol DropDownTableViewDataSource:class {
    func numberOfItems() -> Int
    func itemForIndex(index: Int) -> DDListItem
    func subitemsForIndex(index: Int) -> [DDListSubitem]
    func disclosureIndicatorImageForItem(index: Int) -> UIImage?
    func heightForItem(index: Int) -> CGFloat
    func subitemHeight(_ subItem:Int) -> CGFloat
    func footerHeight() -> CGFloat
}

protocol DropDownTableViewDelegate:class {
    func didOpenItem(_ item: DDListItem, at: Int)
    func didSelectSubitem(_ item: DDListSubitem)
}

class DropDownTableView: UITableView {

    private static let cellID = "DDCell"
    private var openedItem: Int = 0
    private var openedItemView: DDItemView?
    
    var items:[DDListItem] = []
    
    weak var dropDownDataSource:DropDownTableViewDataSource!
    weak var dropDownDelegate:DropDownTableViewDelegate!
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func indexPathesFor(item: Int) -> [IndexPath] {
        var pathes:[IndexPath] = []
        let count = self.dropDownDataSource.subitemsForIndex(index: item).count
        
        for i in 0 ..< count {
            let path = IndexPath(row: i, section: item)
            pathes.append(path)
        }
        
        return pathes
    }
    
    func commonInit() {
        self.register(UINib(nibName: "DDTaleViewCell", bundle: nil), forCellReuseIdentifier: DropDownTableView.cellID)
        self.delegate = self
        self.dataSource = self
    }

    private func onItemTap(_ section: Int, item: DDItemView) {
        if !self.isOpenSection(section) {
            item.setIndicatorOpen(true)
            self.openedItemView = item
            self.openItem(section, animated: true)
            self.openedItem = section
            self.dropDownDelegate.didOpenItem(self.dropDownDataSource.itemForIndex(index: section), at: section)
        } else {
            self.closeItem(section, animated: true)
        }
    }

}

extension DropDownTableView: DropDownTableViewInterface {
    
    func openItem(_ item: Int, animated: Bool) {
        self.beginUpdates()
        self.closeItem(self.openedItem, animated: animated)
        self.openedItem = item
        self.insertRows(at: self.indexPathesFor(item: item), with: .automatic)
        self.endUpdates()
    }
    
    func closeItem(_ item: Int, animated: Bool) {
        self.openedItemView?.setIndicatorOpen(false)
        if animated {
            self.beginUpdates()
            self.deleteRows(at: self.indexPathesFor(item: item), with: .automatic)
            self.reloadSections(IndexSet(integer: item), with: .automatic)
            self.endUpdates()
        } else {
            self.reloadData()
        }
    }
    
    
    func isOpenSection(_ section: Int) -> Bool {
        return section == self.openedItem
    }
    
    func reload() {
        self.reloadData()
    }
}

extension DropDownTableView:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == self.openedItem {
            return self.dropDownDataSource.itemForIndex(index: section).subitems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DropDownTableView.cellID, for: indexPath) as! DDTableViewCell
        cell.selectedBackgroundView = UIView()
        cell.titleLabel.text = self.dropDownDataSource.itemForIndex(index: indexPath.row).title
        
        if (cell.isSelected) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let height = self.dropDownDataSource.heightForItem(index: section)
        
        let ddItemView = DDItemView(width: self.bounds.size.width, height: height)
        ddItemView.titleLabel.text = self.dropDownDataSource.itemForIndex(index: section).title
        ddItemView.disclousureIndicatorImageView.image = self.dropDownDataSource.disclosureIndicatorImageForItem(index: section)
        ddItemView.tag = section
        
        ddItemView.onTap = { sender in
            DispatchQueue.main.async {
                self.onItemTap(section, item: sender)
            }
            
        }
        return ddItemView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.dropDownDataSource.heightForItem(index: section)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.dropDownDataSource.heightForItem(index: section)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == self.openedItem {
           return DDItemFooterView(width: self.frame.size.width, height: self.dropDownDataSource.footerHeight())
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == self.openedItem {
            return self.dropDownDataSource.footerHeight()
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        if section == self.openedItem {
            return self.dropDownDataSource.footerHeight()
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            self.dropDownDelegate.didSelectSubitem(self.items[indexPath.section].subitems[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.dropDownDataSource.subitemHeight(indexPath.row)
    }
   
}
