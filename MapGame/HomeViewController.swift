//
//  HomeViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/10/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var vcCameraText = CameraSpeakViewController()
    var vcGame = GameWriteViewController()
    var vcThemeVideo = ThemeVideoViewController()
    var vcProfile = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func clickCameraWrite(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        vcCameraText = storyboard.instantiateViewController(withIdentifier: "CameraSpeakViewController") as UIViewController as! CameraSpeakViewController
        var navigationController = UINavigationController(rootViewController: vcCameraText)
        navigationController.isNavigationBarHidden = true
        self.navigationController?.present(navigationController, animated: true, completion: nil)
    }

    @IBAction func clickGame(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        vcGame = storyboard.instantiateViewController(withIdentifier: "GameWriteViewController") as UIViewController as! GameWriteViewController
        self.present(vcGame, animated: true, completion: nil)
    }

    @IBAction func clickVideo(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        vcThemeVideo = storyboard.instantiateViewController(withIdentifier: "ThemeVideoViewController") as UIViewController as! ThemeVideoViewController
        self.present(vcThemeVideo, animated: true, completion: nil)
    }
    
    @IBAction func clickProfile(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        vcProfile = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as UIViewController as! ProfileViewController
        self.present(vcProfile, animated: true, completion: nil)
    }
    
}
