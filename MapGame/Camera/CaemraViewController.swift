//
//  CaemraViewController.swift
//  GameDemo
//
//  Created by Nguyễn Đức Tài on 3/7/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class CaemraViewController: UIViewController {

    @IBOutlet weak var imageTake: UIImageView!
    @IBOutlet weak var viewText: UIView!
    @IBOutlet weak var lblImage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageTake.layer.shadowOpacity = 0.7;
        
        lblImage.text = "ChaoCacBan"
        
        viewText.layer.cornerRadius = 7
        viewText.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
