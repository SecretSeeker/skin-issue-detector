//
//  classifier.swift
//  hackathon_ml
//
//  Created by philips on 07/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import CoreML
import UIKit

enum ClassifierError : Error {
    case RuntimeError(String)
}

class Classifier: NSObject {
//    let model = saved_modelmlmodel()
//
//    private func predict(_ input: CVPixelBuffer) -> MLMultiArray {
//        guard let modelPrediction = try? model.prediction(img: input) else {
//            fatalError("Unable to make prediction")
//        }
//        return modelPrediction.output
//    }
//
//    public func makePrediction(_ onInputData: CVPixelBuffer) throws -> Int {
//        let modelPrediction: MLMultiArray?
//
//        modelPrediction = self.predict(onInputData)
//
//        /*
//         0 : Actinitic keratotis
//         1 :  Basal cell carcinoma
//         2 : Dermatofibroma
//         3 : Melanoma
//         4 : Seborrheic keratosis
//         5 : Squamous cell carcinoma
//         6 : Vascular lesion
//
//         */
//
//        guard let class0 = modelPrediction?[0], let class1 = modelPrediction?[1],let class2 = modelPrediction?[2], let class3 = modelPrediction?[3],let class4 = modelPrediction?[4],let class5 = modelPrediction?[5],let class6 = modelPrediction?[6] else {
//            throw ClassifierError.RuntimeError("Predicted values are invalid")
//        }
//
//        var array: [Double] = []
//
//        array.append(Double(truncating: class0))
//        array.append(Double(truncating: class1))
//        array.append(Double(truncating: class2))
//        array.append(Double(truncating: class3))
//        array.append(Double(truncating: class4))
//        array.append(Double(truncating: class5))
//        array.append(Double(truncating: class6))
//
//
//        let maximum = array.max()
//
//       if let maximumIndex = array.indices.filter({array[$0] == maximum}).first
//       {
//        return maximumIndex
//        }
//
//
//            return 2
//      //  return Double(truncating: predictedClassAcne) > Double(truncating: predictedClassEczema) ? 0 : 1
//    }
}
