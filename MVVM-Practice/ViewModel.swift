//
//  ViewModel.swift
//  MVVM-Practice
//
//  Created by 島仁誠 on 2017/02/18.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import Foundation
import Bond
import Alamofire
import SwiftyJSON

class ViewModel: NSObject {
    
    var text = Observable<String?>("")
    var models = MutableObservableArray([Model]())
        
    override init() {
        super.init()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeUpdate(_:)), userInfo: nil, repeats: true)
    
        fetchAPI()
    }
    
    func timeUpdate(_ timer: Timer) {
        text.value = Date().description
        
        let model = Model()
        model.text = Date().description
        models.append(model)
        
    }
    
    func fetchAPI() {
        let url = URL(string: "https://qiita.com/api/v2/items")
        Alamofire.request(url!).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("success:\(json)")
            case .failure(let error):
                print("error:\(error)")
            }
        })
    }

}
