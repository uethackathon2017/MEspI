//
//  ClickButton.swift
//  GameDemo
//
//  Created by Nguyễn Đức Tài on 3/2/17.
//  Copyright © 2017 TranAn. All rights reserved.
//

import UIKit

class ClickButton: SpringButton {


    var selectedRow: Int = 0
    var selectedEasing: Int = 0
    
    var selectedForce: CGFloat = 1
    var selectedDuration: CGFloat = 1
    var selectedDelay: CGFloat = 0
    
    var selectedDamping: CGFloat = 0.7
    var selectedVelocity: CGFloat = 0.7
    var selectedScale: CGFloat = 1
    var selectedX: CGFloat = 0
    var selectedY: CGFloat = 0
    var selectedRotate: CGFloat = 0
    
    var lableInView = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView(text: "")
        
    }
    
    init(frame: CGRect , string : String) {
        super.init(frame: frame)
        setUpView(text: string)
    }
    
    
    func  setUpView(text : String)  {
        //set up rootView
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.7
        
        // set up lable View
        lableInView = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        lableInView.backgroundColor = UIColor.clear
        lableInView.translatesAutoresizingMaskIntoConstraints = false;
        lableInView.text = text
        lableInView.textAlignment = .center
        
        self.addSubview(lableInView)
        
        // add contraint
        self.addConstraint(NSLayoutConstraint(item: lableInView, attribute: NSLayoutAttribute.leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: lableInView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: lableInView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: lableInView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        
    }
    
    // touch in View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateView()
    }
    
    // set up animation for View
    func animateView() {
        setOptions()
        self.animate()
    }
    
    func setOptions() {
        self.force = selectedForce
        self.duration = selectedDuration
        self.delay = selectedDelay
        
        self.damping = selectedDamping
        self.velocity = selectedVelocity
        self.scaleX = selectedScale
        self.scaleY = selectedScale
        self.x = selectedX
        self.y = selectedY
        self.rotate = selectedRotate
        
        self.animation = Spring.AnimationPreset.Pop.rawValue
        self.curve = Spring.AnimationPreset.Pop.rawValue
    }
    
    public func setLable(size : Int) {
        lableInView.font = lableInView.font.withSize(20)
    }
    
    @IBInspectable var color: UIColor? {
        didSet {
            lableInView.backgroundColor = color
        }
    }

}
