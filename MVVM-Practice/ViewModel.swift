//
//  ViewModel.swift
//  MVVM-Practice
//
//  Created by 島仁誠 on 2017/02/18.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import Foundation
import Bond

class ViewModel: NSObject {
    
    var text = Observable<String?>("")
    var model = Model()
        
    override init() {
        super.init()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeUpdate(_:)), userInfo: nil, repeats: true)
        
    }
    
    func timeUpdate(_ timer: Timer) {
        text.value = Date().description
    }

}
