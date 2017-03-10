//
//  ThemeVideoViewController.swift
//  GameDemo
//
//  Created by Nguyễn Đức Tài on 3/8/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class ThemeVideoViewController: BaseViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //1
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //2
    public func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //3
    public func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                      for: indexPath)
        cell.backgroundColor = UIColor.black
        // Configure the cell
        return cell
    }

}

