//
//  ViewController.swift
//  iOS_VotingApp
//
//  Created by 小池基文 on 2018/03/04.
//  Copyright © 2018年 iOS_Training_day3_2. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // itemsをJSONの配列と定義
    var enquetes = [Enquete]()
    var enquete: Enquete!
    var selectedId: Int!
    
    @IBOutlet weak var serchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serchButton.backgroundColor = UIColor.white // 背景色
        serchButton.layer.borderWidth = 1.0 // 枠線の幅
        serchButton.layer.borderColor = UIColor.white.cgColor // 枠線の色
        serchButton.layer.cornerRadius = 5.0 // 角丸のサイズ
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        //  利用するセルをtableViewに事前登録
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // カスタムセルの指定
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        // 線を消す
        tableView.separatorColor = UIColor .clear
        
        // Voting-APIにアクセスする
        Alamofire.request("http://saitos.wmsol.info:56843/enquetes").responseJSON {response in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                let enquete:[AnyObject] = dict["enquete"] as! [AnyObject]
                for value in enquete {
                    print(value)
                    self.enquete = Enquete()
                    self.enquete?.questionId = value["id"] as! Int
                    self.enquete?.question   = value["question"]! as! String
                    self.enquete?.title      = value["title"]! as! String
                    self.enquetes.append(self.enquete!)
                }
            }
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.enquetes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        cell.labelCell?.text = "【" + self.enquetes[indexPath.row].title + "】" + "\n" + self.enquetes[indexPath.row].question
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }

    // Cell が選択された場合
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedId = enquetes[indexPath.row].questionId
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "detailViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "detailViewController") {
            let detailVC: DetailViewConroller = (segue.destination as? DetailViewConroller)!
            // DetailViewController のenqueteIdに選択された画像を設定する
            detailVC.enqueteId = selectedId
        }
    }
}

