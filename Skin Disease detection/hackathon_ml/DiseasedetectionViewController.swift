//
//  Diseasedetection.swift
//  hackathon_ml
//
//  Created by philips on 11/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import  UIKit

//tick bite?
//
/*
 
 0 : Acne/Rosacea
 1 : Vitiligo
 2 : Nail Psoriasis
 3 : Psoriasis (Plaque)
 4 : Eczema(hand)
 5 : Corn
 6 : Candidiasis (Yeast infection)
 
 */

class DiseaseDetectionViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var galleryImage: UIImage!
    
    var imagePicker = UIImagePickerController()

    
    @IBOutlet weak var pageTitle: UILabel!
    
    
    @IBOutlet weak var closeButton: UIButton!
    
    
    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var useGalleryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.delegate = self

        
    }
    
    
    @IBAction func onCloseTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func takePicture(_ sender: Any) {
        imagePicker.sourceType = .camera
        self.present(imagePicker,animated: true, completion: nil)
    }
    
    @IBAction func useGallery(_ sender: Any) {
        
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
            previewVC.diseaseOrLesion = "disease"
            previewVC.isCameraImage = self.imagePicker.sourceType == .camera ? true : false
            self.present(previewVC, animated: true, completion: nil)
        })
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker = UIImagePickerController()
        dismiss(animated: true, completion: nil)
    }
  
    
}
