//
//  LesionViewController.swift
//  hackathon_ml
//
//  Created by philips on 11/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import UIKit

/*
0 : Actinitic keratotis
1 :  Basal cell carcinoma
2 : Dermatofibroma
3 : Melanoma
4 : Seborrheic keratosis
5 : Squamous cell carcinoma
6 : Vascular lesion

*/


class LesionViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var pageTitle
    : UILabel!
    @IBOutlet weak var useOculusButton: UIButton!
    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var useGalleryButton: UIButton!
    
    var galleryImage: UIImage!
    
    var imagePicker = UIImagePickerController()

    
    
    @IBAction func onCloseTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self
    }
    

    
    
    @IBAction func useOculus(_ sender: Any) {
    }
    
    @IBAction func takePicture(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        self.present(imagePicker,animated: true, completion: nil)
    }
    
    @IBAction func useGallery(_ sender: Any) {
        
        print("hey!")
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .savedPhotosAlbum
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage]
            as? UIImage else {
                return
        }
        
        galleryImage = image
        
        
        self.dismiss(animated: true, completion: {
            
            let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let previewVC =   storyboard.instantiateViewController(withIdentifier: "PreviewViewController") as! PreviewViewController
            previewVC.image = self.galleryImage
            previewVC.diseaseOrLesion = "lesion"
            previewVC.isCameraImage = self.imagePicker.sourceType == .camera ? true : false
            self.present(previewVC, animated: true, completion: nil)
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker = UIImagePickerController()
        dismiss(animated: true, completion: nil)
    }
}
