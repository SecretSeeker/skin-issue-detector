//
//  DiseaseClassifier.swift
//  hackathon_ml
//
//  Created by philips on 14/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import CoreML


enum DiseaseClassifierError : Error {
    case RuntimeError(String)
}
class DiseaseClassifier: NSObject {
    
    let model = skinDiseasemlmodel()
    
    private func predict(_ input: CVPixelBuffer) -> MLMultiArray {
        guard let modelPrediction = try? model.prediction(img: input) else {
            fatalError("Unable to make prediction")
        }
        return modelPrediction.output
    }
    
    public func makePrediction(_ onInputData: CVPixelBuffer) throws -> Int {
        let modelPrediction: MLMultiArray?
        
        modelPrediction = self.predict(onInputData)
        
        /*
         
         0 : Acne/Rosacea
         1 : Vitiligo
         2 : Nail Psoriasis
         3 : Psoriasis (Plaque)
         4 : Eczema(hand)
         5 : Corn
         6 : Candidiasis (Yeast infection)
         
         */
        
        guard let class0 = modelPrediction?[0], let class1 = modelPrediction?[1],let class2 = modelPrediction?[2], let class3 = modelPrediction?[3],let class4 = modelPrediction?[4],let class5 = modelPrediction?[5],let class6 = modelPrediction?[6] else {
            throw ClassifierError.RuntimeError("Predicted values are invalid")
        }
        
        var array: [Double] = []
        
        array.append(Double(truncating: class0))
        array.append(Double(truncating: class1))
        array.append(Double(truncating: class2))
        array.append(Double(truncating: class3))
        array.append(Double(truncating: class4))
        array.append(Double(truncating: class5))
        array.append(Double(truncating: class6))
        
        
        let maximum = array.max()
        
        if let maximumIndex = array.indices.filter({array[$0] == maximum}).first
        {
            return maximumIndex
        }
        
        
        return 0
        //  return Double(truncating: predictedClassAcne) > Double(truncating: predictedClassEczema) ? 0 : 1
    }
}
