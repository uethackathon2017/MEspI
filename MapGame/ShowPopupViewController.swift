//
//  ShowPopupViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/9/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class ShowPopupViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    open func showInView(_ aView: UIView!, withImage image : UIImage!, withMessage message: String!, animated: Bool)
    {
        aView.addSubview(self.view)
        //logoImg!.image = image
        //messageLabel!.text = message
        if animated
        {
            self.showAnimate()
        }
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        
        self.view.layer.cornerRadius = 10
        self.view.clipsToBounds = true
        self.view.frame = CGRect(x: self.view.frame.size.width/2 - self.view.frame.size.width * 9/20 + 20, y: 40, width: self.view.frame.size.width * 9/10, height: self.view.frame.size.height * 4.5 / 5)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            self.view.layer.cornerRadius = 10
            self.view.clipsToBounds = true
            self.view.frame = CGRect(x: self.view.frame.size.width/2 - self.view.frame.size.width * 9/20 + 20, y: 40, width: self.view.frame.size.width * 9/10, height: self.view.frame.size.height * 4.5 / 5)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction open func closePopup(_ sender: AnyObject) {
        self.removeAnimate()
    }


}
