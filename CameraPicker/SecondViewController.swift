//
//  SecondViewController.swift
//  CameraPicker
//
//  Created by santhosh on 30/04/18.
//  Copyright © 2018 BINARY. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ImageViewOutlet: UIImageView!
    
    var profilePic = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
//    UIImageDelegateMethods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
          profilePic = image
          ImageViewOutlet.contentMode = .scaleAspectFit
          ImageViewOutlet.image = profilePic
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- IBActions
    @IBAction func cameraButton(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            openCamera()
        }else{
            self.showAlertMessage(title: "No Camera", msg: "This device not supported camera")
        }
        
    }
    
    @IBAction func onClickOfGalleryButton(_ sender: UIButton) {
        self.openLibrary()
    }
    
    
    //MARK:- Func
    func openCamera(){
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.popoverPresentationController?.sourceView = self.view
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func openLibrary(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imagePicker.sourceType = .photoLibrary
        modalPresentationStyle = .fullScreen
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
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
