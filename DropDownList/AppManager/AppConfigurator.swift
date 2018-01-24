//
//  AppConfigurator.swift
//  DropDownList
//
//  Created by Elon Musk on 1/20/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit

enum AppScene {
    case drop_down_list
    case uknown
}

class AppConfigurator: NSObject {
    
    static let configurator = AppConfigurator()
    private lazy var window: UIWindow = {
        return UIApplication.shared.windows.first!
    }()
    
    
    func presentScene(_ scene: AppScene) {
        
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.window.rootViewController = self.viewController(scene)
        }, completion: { completed in
            
        })
    }
    
}


private extension AppConfigurator {
    
    private struct ViewControllersIds {
        static let ddList = "rootViewController"
    }
    
    private struct StoryboardsIdentifiers {
        static let ddList = "DDList"
    }
    
    private func viewController(_ scene: AppScene) -> UIViewController {
        switch scene {
        case .drop_down_list:
            let sb = UIStoryboard.init(name: StoryboardsIdentifiers.ddList, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ViewControllersIds.ddList)
            return vc
        default:
            let assertCondition = true
            assert(assertCondition, "Unknown scene")
            return UIViewController()
        }
    }
}
