//
//  BaseViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/10/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    @IBOutlet weak var btnHome: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnHome.addTarget(self, action: "clickHome:", for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func clickHome(_ sender: AnyObject?) {
        
//        self.dismiss(animated: false, completion: { () -> Void in
//            let usersVC: HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//        })
        
        self.dismiss(animated: true) {
            
        }
    }
    
}