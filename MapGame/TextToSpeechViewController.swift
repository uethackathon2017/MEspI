//
//  TextToSpeechViewController.swift
//  MapGame
//
//  Created by Os on 3/12/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit
import TesseractOCR
import AVFoundation
class TextToSpeechViewController: UIViewController,G8TesseractDelegate {

    @IBOutlet weak var viewPath: LCPaintView!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPath.lineColor = UIColor.black
        // Do any additional setup after loading the view.
    }

    @IBAction func resetTouch(_ sender: Any) {
        viewPath.clear()
    }

    @IBAction func clickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func speech(_ sender: Any) {
        print(check())
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string:check())
        utterance.rate = 0.2
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        synthesizer.speak(utterance)
    }
    func convertView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    func check() -> String{
        if let tesseract = G8Tesseract(language: "eng") {
            tesseract.delegate = self
            tesseract.image = (self.convertView(view: self.viewPath)).g8_blackAndWhite()
            tesseract.recognize()
            let text = tesseract.recognizedText as NSString
                return text as String
            }
        return ""
    }
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition Progress \(tesseract.progress) %")
    }
    
}
