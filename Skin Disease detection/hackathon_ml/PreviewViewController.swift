//
//  PreviewViewController.swift
//  hackathon_ml
//
//  Created by philips on 13/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import UIKit
import CoreML




class PreviewViewController: UIViewController{
    var image: UIImage!
    var isCameraImage: Bool = false
    var diseaseOrLesion: String = ""
    @IBOutlet weak var previewImage: UIImageView!
    
    @IBOutlet weak var processingLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var questionView: UIView!
    
    @IBOutlet weak var processingView: UIView!
    

    @IBAction func onCloseTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
        
        
        

    }
    
    @IBAction func onYesTapped(_ sender: Any) {
        
        questionView.isHidden = true
        processingView.isHidden = false
        
        if let resizedImage = resize(image: image, newSize: CGSize.init(width: 120.0, height: 120.0)){
            if let imageInCVB = resizedImage.toCVPixelBuffer(){
                
                
                if diseaseOrLesion == "disease"{
                   
                    do {
                        let output = try DiseaseClassifier().makePrediction(imageInCVB)
                        print("+++\(output)")
                        
                        let classString =  getDiseaseName(outputNumber: output)
                        
                        
                        
                        processingLabel.text = "It looks like a case of \(classString)" + "Please consult your dermatologist."
                    }catch{
                        print("Wrong image")
                    }
                    
                }
                
                if diseaseOrLesion == "lesion"{
                    
//                    do {
//                        let output = try Classifier().makePrediction(imageInCVB)
//                        print("+++\(output)")
//
//                        let classString =  getClassName(outputNumber: output)
//
//
//
//                        processingLabel.text = "It looks like a case of \(classString)" + "Please consult your dermatologist."
//                    }catch{
//                        print("Wrong image")
//                    }
                }
                    
                }
                
            
        }
        
        
     
    }
    
    func getDiseaseName(outputNumber: Int) -> String{
        
        
        /*
         
         0 : Acne/Rosacea
         1 : Vitiligo
         2 : Nail Psoriasis
         3 : Psoriasis (Plaque)
         4 : Eczema(hand)
         5 : Corn
         6 : Candidiasis (Yeast infection)
         
         */
        var outputClass = ""

        
        switch outputNumber {
        case 0:
            
            outputClass = "Acne/Rosacea"
            
        case 1:
            outputClass = "Vitiligo"
            
        case 2:
            outputClass = "Nail Psoriasis"
        case 3:
            outputClass = "Psoriasis (Plaque)"
            
        case 4:
            outputClass = "Eczema(hand)"
            
            
        case 5:
            outputClass = "Corn"
            
        case 6:
            outputClass = "Vascular lesion"
            
        default:
            outputClass = "Candidiasis (Yeast infection)"
            
        }
        
        return outputClass
    }
    
    func getClassName(outputNumber: Int) -> String{
        var outputClass = ""
        
        if isCameraImage {
            return "Looks normal/Minor injury"
        }
        
        /*
         0 : Actinitic keratotis
         1 :  Basal cell carcinoma
         2 : Dermatofibroma
         3 : Melanoma
         4 : Seborrheic keratosis
         5 : Squamous cell carcinoma
         6 : Vascular lesion
         
         */

        switch outputNumber {
        case 0:
        
        outputClass = "Actinitic keratotis"
            
        case 1:
            outputClass = "Basal cell carcinoma"

        case 2:
            outputClass = "Dermatofibroma"
        case 3:
            outputClass = "Melanoma"

        case 4:
            outputClass = "Seborrheic keratosis"


        case 5:
            outputClass = "Squamous cell carcinoma"

        case 6:
            outputClass = "Vascular lesion"

        default:
            outputClass = "Looks normal/Minor injury"

        }
        
        return outputClass
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        processingView.isHidden = true
        questionView.isHidden = false
        if image !=  nil{
            previewImage.image = image
        }
        
    }
    
    
    func resize(image: UIImage, newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
}

extension UIImage {
    func toCVPixelBuffer() -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int(self.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard status == kCVReturnSuccess else {
            return nil
        }
        
        if let pixelBuffer = pixelBuffer {
            CVPixelBufferLockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
            let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer)
            
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            let context = CGContext(data: pixelData, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
            
            context?.translateBy(x: 0, y: self.size.height)
            context?.scaleBy(x: 1.0, y: -1.0)
            
            UIGraphicsPushContext(context!)
            self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
            UIGraphicsPopContext()
            CVPixelBufferUnlockBaseAddress(pixelBuffer, CVPixelBufferLockFlags(rawValue: 0))
            
            return pixelBuffer
        }
        
        return nil
    }
}
