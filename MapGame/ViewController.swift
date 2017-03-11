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
                    ,0,2,1,1,1,0,2,0,1
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
    
    
    var popViewController : TrueFalseViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

    @IBAction func clickRootView(_ sender: Any) {
        var vc : UIViewController = self;
        while ((vc.presentingViewController) != nil) {
            vc = vc.presentingViewController!;
        }
        vc.dismiss(animated: true) {
            
        }
    }
    
}

extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if arrMatrix[indexPath.row] == 2 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let randomNum:UInt32 = arc4random_uniform(3) // range is 0 to 2
            
            let someInt:Int = Int(randomNum)
            
            if someInt == 0 {
                let viewController = storyboard.instantiateViewController(withIdentifier: "TrueFalseViewController") as! TrueFalseViewController
                
                self.popViewController = viewController
                self.popViewController.showInView(self.view, withImage: UIImage(named: ""), withMessage: "", animated: true)
            }
            if someInt == 1 {
                print("question 2")
            }
            if someInt == 2 {
                print("question 3")
            }
        }
        
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
        if arrMatrix[indexPath.row] == 0 {
            cell.imageView.layer.cornerRadius = 10;
            cell.imageView.layer.shadowOpacity = 0.5;
            cell.imageView.layer.masksToBounds = false;
            cell.imageView.clipsToBounds = false;
        }else{
            if arrMatrix[indexPath.row] == 9 {
                cell.imageView.image = UIImage(named : "songoku")
            }
            else if arrMatrix[indexPath.row] == 2 {
                let arrayCount = UInt32(imagesQuestion.count)
                let unsignedRandomNumber = arc4random_uniform(arrayCount)
                let randomNumber = Int(unsignedRandomNumber)
                cell.imageView.image = UIImage(named : imagesQuestion[randomNumber])
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


