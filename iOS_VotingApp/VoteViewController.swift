//
//  VoteViewController.swift
//  iOS_VotingApp
//
//  Created by 小池基文 on 2018/03/07.
//  Copyright © 2018年 iOS_Training_day3_2. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var list:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = "食べ物に関するアンケート"
        labelQuestion.text = "好きな食べ物を選んでください"
        pickerView.dataSource = self
        pickerView.delegate = self
        list = ["りんご","みかん","いちご","ぶどう"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 表示する列数
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // アイテム表示個数を返す
        return list.count
    }
    
    // UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 表示する文字列を返す
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 選択時の処理
        print(list[row])
    }
    
    @IBAction func touchReturnList(_ sender: UIButton) {
        // ListViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "listViewController",sender: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
