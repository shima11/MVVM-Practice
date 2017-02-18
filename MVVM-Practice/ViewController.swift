//
//  ViewController.swift
//  MVVM-Practice
//
//  Created by 島仁誠 on 2017/02/17.
//  Copyright © 2017年 jinsei shima. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.bnd_text.map({ str in
            return "input:" + str!
        }).bind(to: label.bnd_text)
        
        viewModel.text.bind(to: dateLabel.bnd_text)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

