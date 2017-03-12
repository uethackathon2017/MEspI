//
//  ThemeVideoViewController.swift
//  GameDemo
//
//  Created by Nguyễn Đức Tài on 3/8/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class ThemeVideoViewController: BaseViewController,UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.width*9/32
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistTableViewCell") as! PlaylistTableViewCell
        cell.imagePlaylist.image = UIImage(named: VideoConstain.arrayImagePlaylist[indexPath.row])
        cell.imagePlaylist.layer.cornerRadius = 5
        cell.imagePlaylist.clipsToBounds = true
        
        cell.lblDescription.text = VideoConstain.arrayDescriptionPlaylist[indexPath.row]
                
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VideoConstain.arrayImagePlaylist.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"VideoViewController") as! VideoViewController
        viewController.keyword = VideoConstain.arrayKeyword[indexPath.row]
        viewController.stringTitle = VideoConstain.arrayDescriptionPlaylist[indexPath.row]
        self.present(viewController, animated: true)
    }

}

