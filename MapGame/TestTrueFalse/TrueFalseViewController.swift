//
//  TrueFalseViewController.swift
//  GameDemo
//
//  Created by Nguyễn Đức Tài on 3/2/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

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
    
    var checkAns : Bool = true
    var Answer : Bool = false
    var answerTrue = NSString()
    var numberQuestion = NSInteger()
    var stringTitle = NSString ()
    var point = NSInteger ()
    
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
        answerTrue = "Banana"
        btnNextQuestion.isHidden = false
        lblTitle.text = "1/3"

        
        viewNextQuestion.layer.cornerRadius = 10;
        viewNextQuestion.layer.masksToBounds = true;
        viewNextQuestion.layer.shadowOpacity = 0.5;
        viewNextQuestion.layer.masksToBounds = false;
        viewNextQuestion.clipsToBounds = false;
        
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
        checkAns = true
        if checkAns == Answer { // chọn đúng đáp án..
            viewShowImage.animateView(duration : 3) // animation view
            showSoundTrue()     // sound ..
        }
        else{                   // chọn sai đáp án..
            viewShowImage.animateView(duration : 0.8)
            animationShowAnswer()  // show answer đúng...
        }
    }

    @IBAction func clickFalse(_ sender: Any) {
        print("flase")
        checkAns = false
        if checkAns == Answer { // chọn đúng đáp án..
            viewShowImage.animateView(duration : 3) // animation view
            showSoundTrue()
        }
        else{                   // chọn sai đáp án..
            viewShowImage.animateView(duration : 0.8)
            animationShowAnswer() // show answer đúng...
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
            //sleep(4)
        }
    }
    
    func animationShowAnswer (){
        lblAnswer.isHidden = true
        textAnswerTrue.isHidden = false
        textAnswerTrue.text = answerTrue as String
        textAnswerTrue.center = CGPoint(x: -200, y: self.textAnswerTrue.frame.origin.y)
        
        UILabel .animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            self.textAnswerTrue.frame = CGRect(x: self.view.frame.size.width/2 - self.textAnswerTrue.frame.size.width/2, y: self.lblAnswer.frame.origin.y, width: self.textAnswerTrue.frame.size.width, height: self.textAnswerTrue.frame.size.height)
        }) { (Bool) in
            
        }
        
//        lblAnswer.frame = CGRect(x: self.view.frame.size.width/2 - self.lblAnswer.frame.size.width/2, y: self.lblAnswer.frame.origin.y,width: self.lblAnswer.frame.size.width, height: self.lblAnswer.frame.size.height)
        
//        UILabel .animate(withDuration: 2.0, delay: 0.0, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
//            self.lblAnswer.frame = CGRect(x: 700, y: self.lblAnswer.frame.origin.y, width: self.lblAnswer.frame.size.width, height: self.lblAnswer.frame.size.height)
//        }) { (Bool) in
//            
//        }
    }
    
    func showSoundTrue (){
//        SoundEngine.shared.playBackgroundMusic("sound2.caf", loop: true)
//        SoundEngine.shared.stopBackgroundMusic(fadeOut: true)
    }
    
    func nextViewReloadData (){
        lblAnswer.isHidden = false
        textAnswerTrue.isHidden = true
        
        viewNextQuestion.center = CGPoint(x: 700, y: 74 + self.viewNextQuestion.frame.size.height/2)
        UIView .animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.transitionCurlDown, animations: {

            self.viewNextQuestion.frame = CGRect(x: 5, y: 74, width: self.viewNextQuestion.frame.size.width, height: self.viewNextQuestion.frame.size.height)

        }) { (Bool) in
            
        }
    }
    
}
