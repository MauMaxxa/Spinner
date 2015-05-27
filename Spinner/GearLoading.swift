//
//  GearLoading.swift
//  Spinner
//
//  Created by Mauro Callegari on 26/05/15.
//  Copyright (c) 2015 Mauro Callegari. All rights reserved.
//

import Foundation
import UIKit

public class VMGearLoadingView:UIView {
    var imgGear1 = UIImageView()
    var imgGear2 = UIImageView()
    var imgGear3 = UIImageView()
    var removeFromSuperViewOnHide = false

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.initItem()
    }
    
    convenience init(view:UIView){
        self.init(frame: view.bounds)
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    func initItem(){
        self.imgGear1 = UIImageView(image: UIImage(named: "gears 1.png"))
        self.imgGear1.contentMode = UIViewContentMode.Center
        self.imgGear1.center = CGPointMake(self.frame.width/2 - 60, self.frame.height/2 + 20)
        self.addSubview(self.imgGear1)
        
        println(imgGear1)
        println(imgGear1.frame)
        self.imgGear2 = UIImageView(image: UIImage(named: "gears 2.png"))
        self.imgGear2.contentMode = UIViewContentMode.Center
        self.imgGear2.center = CGPointMake(self.frame.width/2 - 19, self.frame.height/2 - 45)
        self.addSubview(self.imgGear2)
        
        
        self.imgGear3 = UIImageView(image: UIImage(named: "gears 3.png"))
        self.imgGear3.contentMode = UIViewContentMode.Center
        self.imgGear3.center = CGPointMake(self.frame.width/2 + 38, self.frame.height/2 - 20)
        self.addSubview(self.imgGear3)
        
        let imgBgView = UIImageView(frame: self.frame)
        imgBgView.image = UIImage(named: "background.png")
        imgBgView.center = CGPointMake(self.frame.width/2, self.frame.size.height/2)
        self.addSubview(imgBgView)
        
        runSpinAnimationWithDuration(8, withView: self.imgGear1, withValue: 10)
        runSpinAnimationWithDuration(8, withView: self.imgGear2, withValue: -18)
        runSpinAnimationWithDuration(8, withView: self.imgGear3, withValue: 15)
    }
    
    func runSpinAnimationWithDuration(duration:CGFloat, withView view:UIView, withValue value:Float){
        CATransaction.begin()
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.byValue = NSNumber(float: value)
        rotationAnimation.duration = CFTimeInterval(duration)
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = NSNumber(float: Float(M_PI * 2))
        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        rotationAnimation.removedOnCompletion = false
        rotationAnimation.fillMode = kCAFillModeForwards
        rotationAnimation.autoreverses = true
        rotationAnimation.repeatCount = 1000 // HUGE_VALF
    
        view.layer.addAnimation(rotationAnimation, forKey: "rotationAnimation")
        CATransaction.commit()
    }
    
    
    
    convenience init?(showGearLoadingForView view:UIView){
        self.init(frame: view.bounds)
        self.alpha = 0
        view.addSubview(self)
        self.showViewWithAnimate(true)
        return nil
    }
    
    func hideGearLoadingForView(view: UIView) -> Bool {
        self.hideViewWithAnimate(true)
        return true
    }

    func showViewWithAnimate(animate: Bool){
        println("mostro")
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 1
            }, completion: { (finished: Bool) in

        })
    }
    
    func hideViewWithAnimate(animate: Bool){
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0
            }, completion: { (finished: Bool) in
                self.removeFromSuperview()
        })
    }
    
}

func getGearLoadingForView(view:UIView) -> AnyObject {
    for member in view.subviews{
        if member.isKindOfClass(VMGearLoadingView){
            return member as! VMGearLoadingView
        }
    }
    return false
}