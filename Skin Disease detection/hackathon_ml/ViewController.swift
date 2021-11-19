//
//  ViewController.swift
//  hackathon_ml
//
//  Created by philips on 07/07/19.
//  Copyright © 2019 philips. All rights reserved.
//


//import Vision
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {
    var mYourImageViewOutlet: UIImageView?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  let request = VNCoreMLRequest(model: model, completionHandler: myResultsMethod)
        let image = UIImage(named: "test")
        
      //  let handler = VNImageRequestHandler(ciImage: image)
        
//        do{
//           try handler.perform([request])
//
//        }catch{
//            print("eroor")
//        }
    //    try! Classifier().makePrediction((image?.toCVPixelBuffer()!)!) == 0 ? print("acne") : print("eczema")
        
    }
    
//    func addImageToUIImageView(){
//        var yourImage: UIImage = UIImage(named: "testimage")!
//        mYourImageViewOutlet.image = yourImagess
//    }
 
    
    func takePhotoTouched() {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = .camera
   // imagePicker.delegate = self
    imagePicker.allowsEditing = true
    present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        dismiss(animated: true) {
//            if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//                let species = self.predict(image: image)
//
//                let alertController = UIAlertController(title: "Prediction", message: String(format: "The image is a %@", self.resultString(species: species)), preferredStyle: .alert)
//                let action = UIAlertAction(title: "Close", style: .default, handler: nil)
//                alertController.addAction(action)
//                self.navigationController?.present(alertController, animated: true, completion: nil)
//            }
//        }

}


