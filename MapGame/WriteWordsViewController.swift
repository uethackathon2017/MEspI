//
//  WriteWordsViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/11/17.
//  Copyright © 2017 TranAn. All rights reserved.okbay be
//

import UIKit
import TesseractOCR

class WriteWordsViewController: UIViewController,G8TesseractDelegate {
    
    var timer = Timer()
    var word = String()
    var charArr = [Character]()
    var arrCell = NSMutableArray()
    var indexNow =  0
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var viewPath: DAScratchPadView!
    
    @IBOutlet weak var P: UIButton!
    var curImage : NSInteger = 0
    var  images : [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        curImage = 0;
        timer = Timer.scheduledTimer(timeInterval:5, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
        //fix
        //        if let tesseract = G8Tesseract(language: "eng") {
        //            tesseract.delegate = self
        //            tesseract.image = UIImage(named: "1.png")?.g8_blackAndWhite()
        //            tesseract.recognize()
        //            textView.text = tesseract.recognizedText
        //        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        word = "ABC"
        charArr = Array(word.characters)
        print(charArr)
    }
    //    func generateText(){
    //        if let tesseract = G8Tesseract(language: "eng") {
    //            tesseract.delegate = self
    //            tesseract.image = (self.convertView(view: self.viewPath)).g8_blackAndWhite()
    //            tesseract.recognize()
    //           // textView.text = tesseract.recognizedText
    //            if (Int)(tesseract.progress) >= 80 {
    //                check(tesseract: tesseract)
    //            }
    //        }
    //
    //    }
    
    @IBAction func PAction(_ sender: Any) {
        self.viewPath.toolType = DAScratchPadToolTypePaint
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }
    
    
    func convertView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    func check(){
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.delegate = self
            tesseract.image = (self.convertView(view: self.viewPath)).g8_blackAndWhite()
            tesseract.recognize()
            let text = tesseract.recognizedText as NSString
            if (Int)(tesseract.progress) >= 80 {
                let cellNow = arrCell[indexNow] as! CustomCollectionViewCell
                let textNow = String(charArr[indexNow])
                print(textNow)
                // let string = "\n\nBLA\nblub"
                let trimmed = text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                //
                if (trimmed == textNow)  {
                    cellNow.lblText.text = trimmed
                    indexNow += 1
                    viewPath.clear(to: UIColor.clear)
                }
                if(indexNow == charArr.count ){
                    timer.invalidate()
                }
            }
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    @IBAction func clickHome(_ sender: Any) {
        var vc : UIViewController = self;
        while ((vc.presentingViewController) != nil) {
            vc = vc.presentingViewController!;
        }
        vc.dismiss(animated: true) {
            
        }
    }
    
}

extension WriteWordsViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        var number = Float(charArr.count)
        var cgFloat : CGFloat = collectionView.frame.size.width
        var someFloat = Float(cgFloat)
        // var number1=UIScreen.main.bounds.size.width/number
        return CGSize(width:CGFloat(someFloat/number), height: collectionView.frame.width/5)
        
    }
    
}

extension WriteWordsViewController : UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return charArr.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.tag = indexPath.row
        cell.lblText.text = "1234"
        arrCell.add(cell)
        return cell
    }
}


