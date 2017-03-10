//
//  GameWriteViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/10/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class GameWriteViewController: BaseViewController {

    var vcTreasure = ViewController()
    var vcWriteWords = WriteWordsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func clickGameTreasure(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        vcTreasure = storyboard.instantiateViewController(withIdentifier: "ViewController") as UIViewController as! ViewController
        self.present(vcTreasure, animated: true, completion: nil)
    }
    
    @IBAction func clickWriteWords(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        vcWriteWords = storyboard.instantiateViewController(withIdentifier: "WriteWordsViewController") as UIViewController as! WriteWordsViewController
        self.present(vcWriteWords, animated: true, completion: nil)
    }
    
    
}
