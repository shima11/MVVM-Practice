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
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    var datas = ObservableArray<Model>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datas = viewModel.models
        datas.bind(to: tableView){ datas, indexPath, tableView in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let model = datas[indexPath.row]
            cell.textLabel?.text = model.text
            return cell
        }
        
        textField.bnd_text.map({ str in
            return "input:" + str!
        }).bind(to: label.bnd_text)
        
        viewModel.text.bind(to: dateLabel.bnd_text)
        
//        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return datas.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "title"
//        return cell
//    }
//}

extension ViewController: UITableViewDelegate {
    
}
