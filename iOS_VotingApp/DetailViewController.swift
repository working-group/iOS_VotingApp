//
//  DetailController.swift
//  iOS_VotingApp
//
//  Created by 小池基文 on 2018/03/05.
//  Copyright © 2018年 iOS_Training_day3_2. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewConroller: UIViewController {
    // アンケートId
    var enqueteId: Int = 0
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelAnswers: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(enqueteId)
        // Voting-APIにアクセスする
        Alamofire.request("http://saitos.wmsol.info:56843/enquetes/\(enqueteId)").responseJSON {response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                for value in dict {
                    print(value)
//                    self.labelTitle.text = value["title"] as! String
//                    self.labelQuestion.text = value["question"] as! String
//                    self.labelAnswers.text  = value["selection"] as! String
                }
            }
        }
        labelTitle.text = "食べ物に関するアンケート"
        labelQuestion.text = "好きな食べ物を選んでください"
        labelAnswers.text = "1.りんご\n\n2.みかん\n\n3.いちご\n\n4.ぶどう"
    }
    
    @IBAction func touchListReturn(_ sender: UIButton) {
        // ListViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "listViewController",sender: nil)
    }
    
    @IBAction func touchDoVote(_ sender: UIButton) {
        // VoteViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "voteViewController",sender: nil)
    }
    
    
    
}
