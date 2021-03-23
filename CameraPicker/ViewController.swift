//
//  ViewController.swift
//  CameraPicker
//
//  Created by santhosh on 29/04/18.
//  Copyright © 2018 BINARY. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UIPopoverControllerDelegate, UINavigationControllerDelegate {
    
    
    var profilePic = UIImage()
    
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UIImagePickerControllerDelegate methods
    //ImagePicker
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageViewOutlet.contentMode = .scaleAspectFit
            profilePic = image
            imageViewOutlet.image = profilePic
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
//UIActions
    @IBAction func onClickOfImageUploadButton(_ sender: Any) {
        showCameraPopup()
    }
    
    
    func showCameraPopup()  {
        _ =  CameraPopup.init { (_ index: Int) in
            let picker = UIImagePickerController()
            picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            
            if index == 0 {
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    picker.sourceType = .camera
                }else{
                    self.showAlertMessage(title: "No Camera", msg: "This device not supported camera")
                }
            } else if index == 1 {
                picker.sourceType = .photoLibrary
            }else {
                
            }
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    
    //Alert
    func showAlertMessage(title:String, msg:String){
        
        let alert = UIAlertController(title: title,
                                      message: msg,
                                      preferredStyle: .alert)
        let OKAction = UIAlertAction(title:"OK", style: .default){(action) in
            
            self.navigationController?.popViewController(animated: true)
        }
        //        alert.addAction(UIAlertAction(title: "OK", style: .default))
        alert.addAction(OKAction)
        present(alert, animated: true)
    }
    
}

