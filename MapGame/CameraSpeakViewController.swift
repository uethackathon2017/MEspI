//
//  CameraSpeakViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/10/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class CameraSpeakViewController: BaseViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickTakePhoto(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vcCameraText = storyboard.instantiateViewController(withIdentifier: "ImagePickerViewController") as UIViewController as! ImagePickerViewController
        self.navigationController?.pushViewController(vcCameraText, animated: true)
    }
}
