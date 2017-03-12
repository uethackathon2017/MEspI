//
//  TrueFalseViewController.swift
//  GameDemo
//
//  Created by Nguyễn Đức Tài on 3/2/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit
import RealmSwift

class TrueFalseViewController:  ShowPopupViewController {

    @IBOutlet weak var viewShowImage: ViewCharacter!
    @IBOutlet weak var imgShow: UIImageView!
    @IBOutlet weak var btnTrue: ClickButton!
    @IBOutlet weak var btnFalse: ClickButton!
    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var textAnswerTrue: UILabel!
    @IBOutlet weak var viewNextQuestion: UIView!
    @IBOutlet weak var btnNextQuestion: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    
    var chooseAns : Bool = true
    var textAnswer : Bool = false
    var answerTrue = NSString()
    var numberQuestion = NSInteger()
    var stringTitle = NSString ()
    
    let realm_1 = try! Realm()
    let realm_2 = try! Realm()
    
    var check_1 = Int()
    var check_2 = Int()
    var point = Int()
    
    
    class func instance() -> TrueFalseViewController {
        let storyboard = UIStoryboard(name: "TrueFalseViewController", bundle: nil)
        return storyboard.instantiateInitialViewController() as! TrueFalseViewController
    }
    
    
    @IBAction func clickRemoveView(_ sender: Any) {
        
        removeAnimate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberQuestion = 0
        btnNextQuestion.isHidden = false
        lblTitle.text = "1/3"
        textAnswerTrue.isHidden = true
        
        viewNextQuestion.layer.cornerRadius = 10;
        viewNextQuestion.layer.masksToBounds = true;
        viewNextQuestion.layer.shadowOpacity = 0.5;
        viewNextQuestion.layer.masksToBounds = false;
        viewNextQuestion.clipsToBounds = false;
        
        randomnImageAndText()
        
        point = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func clickTrue(_ sender: Any) {
        print("true")

        if textAnswer == true { // chọn đúng đáp án..
            viewShowImage.animateView(duration : 3) // animation view
            showSoundTrue()
            point = point + 1// sound ..
        }
        else{                   // chọn sai đáp án..
            viewShowImage.animateView(duration : 0.8)
            animationShowAnswer()  // show answer đúng...
        }
        
        btnTrue.isUserInteractionEnabled = false
        btnFalse.isUserInteractionEnabled = false
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.checkPoint()
            self.numberQuestion = self.numberQuestion + 1
            
            if self.numberQuestion == 1 {
                self.nextViewReloadData()
                self.stringTitle = String(self.numberQuestion+1) + "/3" as NSString
                self.lblTitle.text = self.stringTitle as String
            }
            if self.numberQuestion == 2 {
                self.nextViewReloadData()
                self.stringTitle = String(self.numberQuestion+1) + "/3" as NSString
                self.lblTitle.text = self.stringTitle as String
                self.btnNextQuestion.isHidden = true
                
            }

        }
        
    }

    @IBAction func clickFalse(_ sender: Any) {
        print("flase")
        
        if textAnswer == false { // chọn đúng đáp án..
            viewShowImage.animateView(duration : 3) // animation view
            showSoundTrue()
            animationShowAnswer()
            point = point + 1
            
        }
        else{                   // chọn sai đáp án..
            viewShowImage.animateView(duration : 0.8)
            animationShowAnswer() // show answer đúng...
        }
        
        btnTrue.isUserInteractionEnabled = false
        btnFalse.isUserInteractionEnabled = false
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.checkPoint()
            self.numberQuestion = self.numberQuestion + 1
            
            if self.numberQuestion == 1 {
                self.nextViewReloadData()
                self.stringTitle = String(self.numberQuestion+1) + "/3" as NSString
                self.lblTitle.text = self.stringTitle as String
            }
            if self.numberQuestion == 2 {
                self.nextViewReloadData()
                self.stringTitle = String(self.numberQuestion+1) + "/3" as NSString
                self.lblTitle.text = self.stringTitle as String
                self.btnNextQuestion.isHidden = true
                
            }

        }

    }
    
    @IBAction func clickNextQuestion(_ sender: Any) {
        numberQuestion = numberQuestion + 1
        
        if numberQuestion == 1 {
            nextViewReloadData()
            stringTitle = String(numberQuestion+1) + "/3" as NSString
            lblTitle.text = stringTitle as String
        }
        if numberQuestion == 2 {
            nextViewReloadData()
            stringTitle = String(numberQuestion+1) + "/3" as NSString
            lblTitle.text = stringTitle as String
            btnNextQuestion.isHidden = true
            
        }
    }
    
    func animationShowAnswer (){
        
        lblAnswer.isHidden = true
        textAnswerTrue.isHidden = false
        textAnswerTrue.text = answerTrue as String
        textAnswerTrue.center = CGPoint(x: -200, y: self.textAnswerTrue.frame.origin.y)
        
        UILabel .animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            self.textAnswerTrue.frame = CGRect(x: self.view.frame.size.width/2 - self.textAnswerTrue.frame.size.width/2, y: self.lblAnswer.frame.origin.y, width: self.textAnswerTrue.frame.size.width, height: self.textAnswerTrue.frame.size.height)
        }) { (Bool) in
            
        }
        
    }
    
    func showSoundTrue (){
        SoundEngine.shared.playBackgroundMusic("sound2.caf", loop: true)
        SoundEngine.shared.stopBackgroundMusic(fadeOut: true)
    }
    
    func nextViewReloadData (){
        lblAnswer.isHidden = false
        textAnswerTrue.isHidden = true
        
        randomnImageAndText()
        
        viewNextQuestion.center = CGPoint(x: 700, y: 74 + self.viewNextQuestion.frame.size.height/2)
        UIView .animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.transitionCurlDown, animations: {

            self.viewNextQuestion.frame = CGRect(x: 5, y: 74, width: self.viewNextQuestion.frame.size.width, height: self.viewNextQuestion.frame.size.height)

        }) { (Bool) in
            
        }
    }
    
    func randomnImageAndText (){
        let randomNum_1:UInt32 = arc4random_uniform(UInt32(realm_1.objects(Word.self).count))
        let randomNum_2:UInt32 = arc4random_uniform(UInt32(realm_1.objects(Word.self).count))
        
        let someInt_1:Int = Int(randomNum_1)
        let someInt_2:Int = Int(randomNum_2)
        
        check_1 = Int(randomNum_1)
        check_2 = Int(randomNum_2)
        
        let url = NSURL(string:realm_1.objects(Word.self)[someInt_1].url)
        let data = NSData(contentsOf:url! as URL)
        imgShow.image = UIImage(data:data! as Data)
        
        answerTrue = realm_1.objects(Word.self)[someInt_1].textEng as NSString
        
        textAnswerTrue.text = realm_1.objects(Word.self)[someInt_1].textEng
        
        lblAnswer.text = realm_2.objects(Word.self)[someInt_2].textEng
        
        if check_1 == check_2 {
            textAnswer = true
        }
        else {
            textAnswer = false
        }

        btnTrue.isUserInteractionEnabled = true
        btnFalse.isUserInteractionEnabled = true
    }
    
    func showAlert( title : NSString , message : NSString){
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
            self.removeAnimate()
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
    func checkPoint () {
        if numberQuestion == 2 {
            if point < 2 {
                stringTitle = "Bạn trả lời đúng " + String(point) + "/3" as NSString
                showAlert(title: stringTitle, message: "Bạn chưa vượt qua màn thử thách này!")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ThatBai"), object: nil)
            }
            if point >= 2 {
                stringTitle = "Bạn trả lời đúng " + String(point) + "/3" as NSString
                showAlert(title: stringTitle, message: "Bạn đã vượt qua")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ThanhCong"), object: nil)
            }
        }
    }
}
