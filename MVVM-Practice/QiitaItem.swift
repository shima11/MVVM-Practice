//
//  QiitaItem.swift
//  MVVM-Practice
//
//  Created by 島仁誠 on 2017/02/20.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import Foundation

class QiitaItem {
    let body: String
    let title: String
    let updated_at: String
    let url: String
    
    init(body: String, title: String, updated_at: String, url: String){
        self.body = body
        self.title = title
        self.updated_at = updated_at
        self.url = url
    }
    
}
