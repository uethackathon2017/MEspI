//
//  ProfileViewController.swift
//  GameDemo
//
//  Created by Nguyễn Đức Tài on 3/7/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    
    @IBOutlet weak var avata: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avata.layer.cornerRadius = 55
        avata.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.djscdscd
    }

}
