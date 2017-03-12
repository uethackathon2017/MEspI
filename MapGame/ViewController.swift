//
//  ViewController.swift
//  MapGame
//
//  Created by Trần An on 3/5/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit
import NMPopUpViewSwift

class ViewController:  BaseViewController {
    
    @IBOutlet var viewGame: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrMatrix = [9,0,0,0,1,0,0,1,2
        ,0,0,0,1,1,0,2,0,1
        ,1,0,0,0,2,1,0,0,2
        ,0,0,2,0,1,0,0,2,0
        ,1,1,0,0,0,1,1,2,0
        ,1,1,2,2,0,0,0,2,1
        ,2,1,1,1,0,0,0,2,0
        ,1,1,2,2,1,0,0,0,0
        ,0,0,0,1,2,0,2,0,8]
    
    let imagesStop = [
        "nuida",
        "honuoc",
        "buicay"]
    
    let imagesQuestion = [
        "question",
        "box_question",
        "gift"]
    
    let imagesFinish = [
        "finish",
        "finish_2"]
    var currentIndexX = 0
    var cuurentIndexY = 0
    
    var popViewController : TrueFalseViewController!
    
    let btnMain = UIButton()
    var width = CGFloat()
    var currentSelect = -1
    var arrayMap : [[Int]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.ThatBai), name: NSNotification.Name(rawValue: "ThatBai"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.ThanhCong), name: NSNotification.Name(rawValue: "ThanhCong"), object: nil)
        width = CGFloat(collectionView.frame.size.width/9)
        
    }
    func ThatBai(){
        arrMatrix[currentSelect] = 1
        let indexPath =  NSIndexPath(row: currentSelect, section: 0)
        collectionView.reloadItems(at: [indexPath as IndexPath])
    }
    func ThanhCong(){
        arrMatrix[currentSelect] = 4
        let indexPath =  NSIndexPath(row: currentSelect, section: 0)
        collectionView.reloadItems(at: [indexPath as IndexPath])
    }
    override func viewWillAppear(_ animated: Bool) {
        print("dasdsa")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("dasdsa")
    }
    
    @IBAction func clickRootView(_ sender: Any) {
        var vc : UIViewController = self;
        while ((vc.presentingViewController) != nil) {
            vc = vc.presentingViewController!;
        }
        vc.dismiss(animated: true) {
            
        }
    }
    func moveMainObject(frame : CGRect) {
        
    }
}

extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        var cell = collectionView.cellForItem(at: indexPath) as! CustomCollectionViewCell
        
        
        if arrMatrix[indexPath.row] == 1 {
            
            let alert = UIAlertController(title: "Thông báo!", message: "Không thể đi vào ô này.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        if arrMatrix[indexPath.row] == 0 || arrMatrix[indexPath.row] == 4 {
            // trường hợp đi tiến ngang...
            print("\(cell.center.y) -- \(btnMain.center.y)")
            print("\(fabs(cell.center.x - btnMain.center.x)) -- \(collectionView.frame.size.width / 9)")
            if (((cell.center.y + 2.5) == btnMain.center.y) && (fabs(cell.center.x - btnMain.center.x) <= collectionView.frame.size.width / 9) && (cell.center.x > btnMain.center.x)) {
                UIView .animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.transitionCurlDown, animations: {
                    self.btnMain.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y , width: self.btnMain.frame.size.width, height: self.btnMain.frame.size.height)
                    
                })
            }else{
                if (((cell.center.y + 2.5) == btnMain.center.y) ) {
                    if (fabs(-cell.center.x + btnMain.center.x) <= UIScreen .main.bounds.size.width/9+10){
                        if (cell.center.x < btnMain.center.x){
                            UIView .animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.transitionCurlDown, animations: {
                                self.btnMain.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y , width: self.btnMain.frame.size.width, height: self.btnMain.frame.size.height)
                                
                            })
                        }
                    }
                }
            }

            // trường hợp đi tiến ngang...
            print("\(cell.center.y) -- \(btnMain.center.y)")
            print("\(fabs(cell.center.x - btnMain.center.x)) -- \(collectionView.frame.size.height / 9)")
            if (((cell.center.x + 2.5) == btnMain.center.x) && (fabs(cell.center.y - btnMain.center.y) <= collectionView.frame.size.height / 9) && (cell.center.y > btnMain.center.y)) {
                UIView .animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.transitionCurlDown, animations: {
                    self.btnMain.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y , width: self.btnMain.frame.size.width, height: self.btnMain.frame.size.height)
                    
                })
            }else{
                if (((cell.center.x + 2.5) == btnMain.center.x) ) {
                    if (fabs(-cell.center.y + btnMain.center.y) <= collectionView.frame.size.height/9+10){
                        if (cell.center.y < btnMain.center.y){
                            UIView .animate(withDuration: 0.75, delay: 0.0, options: UIViewAnimationOptions.transitionCurlDown, animations: {
                                self.btnMain.frame = CGRect(x: cell.frame.origin.x, y: cell.frame.origin.y , width: self.btnMain.frame.size.width, height: self.btnMain.frame.size.height)
                                
                            })
                        }
                    }
                }
            }
            
        }
        if arrMatrix[indexPath.row] == 2 {
            if (fabs(-cell.center.y + btnMain.center.y) <= collectionView.frame.size.height/9+10){
                if(fabs(-cell.center.x + btnMain.center.x) <= collectionView.frame.size.width/9+10){
                    if(((cell.center.x + 2.5) == btnMain.center.x )||((cell.center.y + 2.5) == btnMain.center.y)){
                        currentSelect = indexPath.row
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = storyboard.instantiateViewController(withIdentifier: "TrueFalseViewController") as! TrueFalseViewController
                        
                        self.popViewController = viewController
                        self.popViewController.showInView(self.view, withImage: UIImage(named: ""), withMessage: "", animated: true)
                    }
                }
            }
        }
        
            
            
//            let randomNum:UInt32 = arc4random_uniform(1)
//            let someInt:Int = Int(randomNum)
//            
//            if someInt == 0 {
//                let viewController = storyboard.instantiateViewController(withIdentifier: "TrueFalseViewController") as! TrueFalseViewController
//                
//                self.popViewController = viewController
//                self.popViewController.showInView(self.view, withImage: UIImage(named: ""), withMessage: "", animated: true)
//            }
//            if someInt == 1 {
//                print("question 2")
//            }
            
        }
        
    }

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        var width = collectionView.frame.size.width / 9
        var height = width
        return CGSize(width: width, height: height)
    }
}
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        
        if arrMatrix[indexPath.row] == 9 {
            
            btnMain.setBackgroundImage(UIImage.init(named: "songoku"), for: .normal)
            btnMain.frame = CGRect(x: 0, y: 0, width: collectionView.frame.size.width / 9 + 5, height: collectionView.frame.size.width / 9 + 5)
            self.collectionView.addSubview(btnMain)
            arrMatrix[indexPath.row] = 0
            
        }
        else if arrMatrix[indexPath.row] == 2 {
            cell.imageView.image = UIImage(named : "box_question")
        }
        else if arrMatrix[indexPath.row] == 1{
            let arrayCount = UInt32(imagesStop.count)
            let unsignedRandomNumber = arc4random_uniform(arrayCount)
            let randomNumber = Int(unsignedRandomNumber)
            cell.imageView.image = UIImage(named : imagesStop[randomNumber])
        }
        else if arrMatrix[indexPath.row] == 8{
            let arrayCount = UInt32(imagesFinish.count)
            let unsignedRandomNumber = arc4random_uniform(arrayCount)
            let randomNumber = Int(unsignedRandomNumber)
            cell.imageView.image = UIImage(named : imagesFinish[randomNumber])
        }
        else if arrMatrix[indexPath.row] == 4{
            cell.imageView.image = UIImage(named : "new_co")
        }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 81
    }
}


