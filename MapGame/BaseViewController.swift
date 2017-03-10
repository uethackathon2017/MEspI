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
    @IBOutlet weak var btnRootView: UIButton!

    
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
        
        self.dismiss(animated: true) {
            
        }
    }
    
//    func clickRootView(_ sender: AnyObject?) {
//        
//        var vc : UIViewController = self;
//        while ((vc.presentingViewController) != nil) {
//            vc = vc.presentingViewController!;
//        }
//        vc.dismiss(animated: true) {
//            
//        }
//    }
    
}
