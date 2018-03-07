//
//  ResultViewController.swift
//  iOS_VotingApp
//
//  Created by 小池基文 on 2018/03/07.
//  Copyright © 2018年 iOS_Training_day3_2. All rights reserved.
//

import UIKit
import Alamofire

class ResultViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelAnswer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Voting-APIにアクセスする
        Alamofire.request("http://saitos.wmsol.info:56843/answers/1").responseJSON {response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                print(dict)
                self.labelTitle.text = String(format: "%@", dict["id"] as! CVarArg)
                self.labelQuestion.text = String(format: "%@", dict["count"] as! CVarArg)
                self.labelAnswer.text  = String(format: "%@", dict["answers"] as! CVarArg)
                for value in dict {
                    print(value)
//                    self.labelTitle.text = value["title"] as! String
//                    self.labelQuestion.text = value["question"] as! String
//                    self.labelAnswer.text  = value["answers"] as! String
                }
            }
        }
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        // ListViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "listViewController",sender: nil)
    }
    
    
}
