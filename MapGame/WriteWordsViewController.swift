//
//  WriteWordsViewController.swift
//  MapGame
//
//  Created by Nguyễn Đức Tài on 3/11/17.
//  Copyright © 2017 TranAn. All rights reserved.okbay be
//

import UIKit
import TesseractOCR
import RealmSwift
import SDWebImage
class WriteWordsViewController: UIViewController,G8TesseractDelegate {
    
    var timer = Timer()
    var timeDraw = Timer()
    var word = String()
    var charArr = [Character]()
    var arrCell = NSMutableArray()
    var indexNow =  0
    let realm_1 = try! Realm()
    var textResult = ""
    var urlImageResult = ""
    
    @IBOutlet weak var constain: NSLayoutConstraint!
    @IBOutlet weak var viewSuggest: UIView!
    @IBOutlet weak var imageSuggest: UIImageView!
    @IBOutlet weak var lblSuggest: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var viewPath: LCPaintView!
    
    @IBAction func clickBtnArrowDown(_ sender: Any) {
        self.viewSuggest.isHidden = false
        UIView.animate(withDuration: 1.0) {
            self.constain.constant = 0
            self.view.layoutIfNeeded()
            self.timer.invalidate()
            let when = DispatchTime.now() + 2
            DispatchQueue.main.asyncAfter(deadline: when) {
                UIView.animate(withDuration: 1.0) {
                    self.constain.constant = -400
                    self.view.layoutIfNeeded()
                }
                self.timer.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval:5, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
                let when = DispatchTime.now() + 1 // change 2 to desired number of seconds
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.viewSuggest.isHidden = true
                }
                
            }
            
        }
    }
    
    @IBOutlet weak var P: UIButton!
    var curImage : NSInteger = 0
    var  images : [UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPath.lineColor = UIColor.black
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            UIView.animate(withDuration: 1.0) {
                self.constain.constant = -400
                self.view.layoutIfNeeded()
            }
            self.timer = Timer.scheduledTimer(timeInterval:5, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
            
        }
        
        curImage = 0;
        
        NotificationCenter.default.addObserver(self, selector: #selector(WriteWordsViewController.touchEnd), name: NSNotification.Name(rawValue: "touchEnd"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(WriteWordsViewController.touchBegin), name: NSNotification.Name(rawValue: "touchBegin"), object: nil)
        
        let randomNum:UInt32 = arc4random_uniform(UInt32(realm_1.objects(Word.self).count))
        let randomInt:Int = Int(randomNum)
        textResult = realm_1.objects(Word.self)[randomInt].textEng
        urlImageResult = realm_1.objects(Word.self)[randomInt].url
        imageSuggest.sd_setImage(with: URL(string: urlImageResult))
        word = textResult.uppercased()
        charArr = Array(word.characters)
    }
    func touchBegin(){
        timer.invalidate()
        timeDraw.invalidate()
        print("bat dau")
    }
    func touchEnd(){
        print("ket thuc")
        timeDraw = Timer.scheduledTimer(timeInterval:2, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        print(charArr)
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
        print("check")
        if let tesseract = G8Tesseract(language: "eng") {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval:5, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
            timeDraw.invalidate()
            tesseract.delegate = self
            tesseract.image = (self.convertView(view: self.viewPath)).g8_blackAndWhite()
            tesseract.recognize()
            let text = tesseract.recognizedText as NSString
            if (Int)(tesseract.progress) >= 80 {
                if indexNow < charArr.count{
                    let cellNow = arrCell[indexNow] as! CustomCollectionViewCell
                    
                    let textNow = String(charArr[indexNow])
                    print(textNow)
                    // let string = "\n\nBLA\nblub"
                    let trimmed = text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                    //
                    if (trimmed == textNow)  {
                        cellNow.lblText.text = trimmed
                        indexNow += 1
                        viewPath.clear()
                    }
                    else{
                        DispatchQueue.main.async {
                            self.viewPath.clear()
                            self.lblSuggest.isHidden = false
                            self.lblSuggest.text = String(self.charArr[self.indexNow])
                            self.timer.invalidate()
                            let when = DispatchTime.now() + 2
                            DispatchQueue.main.asyncAfter(deadline: when) {
                                self.lblSuggest.isHidden = true
                                self.timer = Timer.scheduledTimer(timeInterval:5, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
                            }
                        }
                    }
                    if(indexNow == charArr.count ){
                        timer.invalidate()
                        indexNow = 0
                        //                        word = ""
                        charArr = []
                        viewPath.clear()
                        let randomNum:UInt32 = arc4random_uniform(UInt32(realm_1.objects(Word.self).count))
                        let randomInt:Int = Int(randomNum)
                        textResult = realm_1.objects(Word.self)[randomInt].textEng
                        urlImageResult = realm_1.objects(Word.self)[randomInt].url
                        imageSuggest.sd_setImage(with: URL(string: urlImageResult))
                        word = textResult.uppercased()
                        charArr = Array(word.characters)
                        
                        arrCell = NSMutableArray()
                        collectionView.reloadData()
                        constain.constant = 0
                        
                        let when = DispatchTime.now() + 3
                        DispatchQueue.main.asyncAfter(deadline: when) {
                            UIView.animate(withDuration: 0.0) {
                                self.constain.constant = -400
                                self.view.layoutIfNeeded()
                            }
                            self.timer.invalidate()
                            self.timer = Timer.scheduledTimer(timeInterval:5, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
                            let when = DispatchTime.now() + 5 // change 2 to desired number of seconds
                            DispatchQueue.main.asyncAfter(deadline: when) {
                                self.viewSuggest.isHidden = true
                            }
                            
                        }
                    }
                }
            }
            else{
                DispatchQueue.main.async {
                    if self.indexNow < self.charArr.count{
                        self.viewPath.clear()
                        self.lblSuggest.isHidden = false
                        self.lblSuggest.text = String(self.charArr[self.indexNow])
                        self.timer.invalidate()
                        let when = DispatchTime.now() + 2
                        DispatchQueue.main.asyncAfter(deadline: when) {
                            self.lblSuggest.isHidden = true
                            self.timer = Timer.scheduledTimer(timeInterval:5, target: self, selector: #selector(WriteWordsViewController.check), userInfo: nil, repeats: true)
                        }
                    }
                    
                }
            }
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.viewSuggest.isHidden = true
        self.dismiss(animated: true) {
            self.timer.invalidate()
            self.timeDraw.invalidate()
        }
    }
    @IBAction func clickHome(_ sender: Any) {
        self.viewSuggest.isHidden = true
        var vc : UIViewController = self;
        while ((vc.presentingViewController) != nil) {
            vc = vc.presentingViewController!;
        }
        vc.dismiss(animated: true) {
            self.timer.invalidate()
            self.timeDraw.invalidate()
        }
    }
    
}

extension WriteWordsViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        //var number = CGFloat(charArr.count)
        //var b = (CGFloat)((Float)(UIScreen.main.bounds.size.width)-((charArr.count+1)*5)/number) as!
        // var number1=UIScreen.main.bounds.size.width/number
        
        //return CGSize(width:CGFloat(someFloat/number), height: CGFloat(someFloat/number))
        
        //return CGSize(width:CGFloat(collectionView.frame.size.width/number), height: CGFloat(collectionView.frame.size.width/number))
        return CGSize(width: Int(Int(collectionView.frame.size.width)/Int(charArr.count)), height: Int(Int(collectionView.frame.size.width)/Int(charArr.count)))
        
    }
    
}

extension WriteWordsViewController : UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return charArr.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
        cell.tag = indexPath.row
        cell.lblText.text = ""
        arrCell.add(cell)
        return cell
    }
    
}


