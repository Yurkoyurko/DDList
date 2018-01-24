//
//  DDItemFooterView.swift
//  DropDownList
//
//  Created by Sloyev iOS on 23.01.2018.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

class DDItemFooterView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    
    
    init(width: CGFloat, height: CGFloat) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: width, height: height))
        self.commonInit(width: width)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit(width: UIScreen.main.bounds.width)
    }
    
    private func commonInit(width: CGFloat) {
        
        Bundle.main.loadNibNamed("DDItemFooterViewPrototype", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
        self.viewWidth.constant = width
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
}
