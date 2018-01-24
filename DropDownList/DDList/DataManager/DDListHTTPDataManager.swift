//
//  DDListHTTPDataManager.swift
//  DropDownList
//
//  Created by Elon Musk on 1/20/18.
//  Copyright © 2018 Yuriy Babych. All rights reserved.
//

import UIKit
import Alamofire

enum DataManagerTasks {
    case fetchList
}

class DDListHTTPDataManager: NSObject {

    var urls : [DataManagerTasks:String]
    
    init(urls:[DataManagerTasks:String]) {
        self.urls = urls
    }
    
    
    func performTask(_ task: DataManagerTasks, complition: @escaping ([[String:Any]], String?) -> Void) {
    
        let url = urls[task]
        Alamofire.request(url!).responseJSON { response in
        
            if response.error != nil {
                complition([], response.error?.localizedDescription)
            } else {
                if let json = response.result.value {
                    //print("JSON: \(json)") // serialized json response
                    let resp = json as! [String:Any]
                    let data = resp["response"] as! [[String:Any]]
                    complition(data, nil)
                    
                } else {
                    complition([], "Error")
                }
            }
        
        }
    }
}
