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
    var qiitaItems = MutableObservableArray([QiitaItem]())
    
    override init() {
        super.init()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeUpdate(_:)), userInfo: nil, repeats: true)
    
        fetchAPI(callback: { [weak self] items in
            guard let `self` = self else { return }
//            self.qiitaItems = items
            for item in items {
                self.qiitaItems.append(item)
            }
        })
    }
    
    func timeUpdate(_ timer: Timer) {
        text.value = Date().description
        
        let model = Model()
        model.text = Date().description
        models.append(model)
        
    }
    
    func fetchAPI(callback: @escaping (MutableObservableArray<QiitaItem>) -> Void) {
        let url = URL(string: "https://qiita.com/api/v2/items")
        Alamofire.request(url!).responseJSON(completionHandler: { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("success:\(json)")
                let items = MutableObservableArray([QiitaItem]())
                for jsonData in json {
                    let data = jsonData.1
                    let body = data["body"].stringValue
                    let title = data["title"].stringValue
                    let updated_at = data["updated_at"].stringValue
                    let url = data["url"].stringValue
                    
                    let item = QiitaItem(body: body, title: title, updated_at: updated_at, url: url)
                    items.append(item)
                }
                callback(items)
            case .failure(let error):
                print("error:\(error)")
            }
        })
    }

}
