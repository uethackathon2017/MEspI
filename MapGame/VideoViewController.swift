//
//  VideoViewController.swift
//  MapGame
//
//  Created by Os on 3/11/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class VideoViewController: BaseViewController ,UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var stringTitle = ""
    
    
    var keyword:String = ""
    var arrayVideo:[Video] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        getVideoWithKeyWord(key:keyword)
        
        lblTitle.text = stringTitle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickRootView(_ sender: Any) {
        var vc : UIViewController = self;
        while ((vc.presentingViewController) != nil) {
            vc = vc.presentingViewController!;
        }
        vc.dismiss(animated: true) {
            
        }
    }
    
    func getVideoWithKeyWord(key:String) {
        let url:String = String("https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=20&q=\(key)&key=\(Constain.key)")
        print(url)
        Alamofire.request(url).responseJSON { (responseData) -> Void in
            var arrRes = [[String:AnyObject]]()
            print(responseData)
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["items"].arrayObject {
                    arrRes = resData as! [[String:AnyObject]]
                    for dic in arrRes{
                        let video:Video = Video()
                        if let title = dic["snippet"]?["title"] as? String! {
                            if let id = dic["id"]?["videoId"] as! String!{
                                video.idVideo = id
                                video.title = title
                                self.arrayVideo.append(video)
                            }
                            
                        }
                        
                        
                    }
                    print(arrRes.count)
                    self.tableView.reloadData()
                }
            }
        }
    }
    func nullToNil(value : AnyObject?) -> AnyObject? {
        if value is NSNull {
            return nil
        } else {
            return value
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.width*9/32
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as! VideoTableViewCell
        let video = self.arrayVideo[indexPath.row]
        print(indexPath.row)
        var string:String = video.idVideo
        print(indexPath.row)
        let html = "<iframe width=\"\(UIScreen.main.bounds.size.width/2)\" height=\"\(UIScreen.main.bounds.size.width*9/32)\" src=\"https://www.youtube.com/embed/\(string)\" frameborder=\"0\" allowfullscreen></iframe>"
        cell.webview.loadHTMLString(html, baseURL: nil)
        cell.webview.scrollView.isScrollEnabled = false
        cell.webview.scrollView.bounces = false
        cell.lblDescription.text = video.title
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayVideo.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
