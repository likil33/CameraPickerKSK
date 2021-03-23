//
//  CameraPopup.swift
//  CameraPicker
//
//  Created by santhosh on 29/04/18.
//  Copyright © 2018 BINARY. All rights reserved.
//

import UIKit

//CONSTANT
let BOUNDS  = UIScreen.main.bounds
let KEY_WINDOW = UIApplication.shared.keyWindow

var popup:CameraPopup? = nil
class CameraPopup: UIView {

    @IBOutlet weak var backGroundViewOutlet: UIView!
    
//     var handler: ((_ buttonIndex: Int) -> Void)? = nil
    var handler:((_ buttonIndex:Int)-> Void)? = nil
    
//     convenience init(completion: @escaping (_ index: Int) -> Void) {
    convenience init(completion: @escaping(_ index:Int) -> Void) {
     self.init()
        
        popup = Bundle.main.loadNibNamed("CameraPopup", owner: popup, options: nil)!.first as? CameraPopup
        popup?.frame = BOUNDS
        popup?.handler = completion
        backGroundViewOutlet? .setShadowToView(color: UIColor.darkGray, offSet: CGSize(width: -1, height: 1))
        KEY_WINDOW?.addSubview(popup!)
        KEY_WINDOW?.bringSubview(toFront: popup!)
        
//        popUp = Bundle.main.loadNibNamed("CameraPopup", owner: popUp, options: nil)!.first as? CameraPopup
//        popUp?.frame = BOUNDS
//        popUp?.handler = completion
//        backGroundViewOutlet.setShadowToView(color: UIColor.darkGray, offSet: CGSize(width: -1, height: 1))
//        KEY_WINDOW?.addSubview(popUp!)
//        KEY_WINDOW?.bringSubview(toFront: popUp!)
    }
    
    @IBAction func onClickOfGalleryButton(_ sender: Any) {
    }
    
    @IBAction func onClickOfCameraButton(_ sender: Any) {
        let button = sender as! UIButton
        handler!(button.tag)
        removeFromSuperview()
    }
    
    
    @IBAction func onClickOfCancelButton(_ sender: Any) {
        removeFromSuperview()
    }
    
}

@IBDesignable extension UIView {
    
    func setShadowToView(color: UIColor, offSet: CGSize) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = 3
        //        self.layer.cornerRadius = 5
        self.layer.masksToBounds = false
}
}
