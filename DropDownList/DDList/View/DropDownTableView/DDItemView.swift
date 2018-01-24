//
//  DDItemView.swift
//  DropDownList
//
//  Created by Elon Musk on 1/20/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

class DDItemView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var disclousureIndicatorImageView: UIImageView!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var separatorWeight: NSLayoutConstraint!
    
    var onTap: (DDItemView) -> Void = { _ in }
    var isDisclousureIndicatorOpened = false
    var disclousureIndicatorTransform: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
    
    
    init(width: CGFloat, height: CGFloat) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: width, height: height))
        
        
        self.commonInit(width: width, height:height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit(width: UIScreen.main.bounds.width, height: 57.0)
    }
    
    private func commonInit(width: CGFloat, height: CGFloat) {
        Bundle.main.loadNibNamed("DDItemHeaderViewPrototype", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.center = self.center
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(DDItemView.recognizerAction))
        self.addGestureRecognizer(recognizer)
        
        self.viewWidth.constant = width
        self.viewHeight.constant = height
        self.separatorWeight.constant = 1/UIScreen.main.scale
        
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    @objc private func recognizerAction() {
        self.onTap(self)
    }
    
    func setIndicatorOpen(_ isOpen: Bool) {
        self.isDisclousureIndicatorOpened = isOpen
        if isOpen {
            UIView.animate(withDuration: 0.3, animations: {
                self.disclousureIndicatorImageView.transform = self.disclousureIndicatorTransform
            })
        } else {
            self.disclousureIndicatorImageView.transform = CGAffineTransform.identity
        }
    }
    
    
    
}
