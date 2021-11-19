//
//  UVProtectionViewController.swift
//  hackathon_ml
//
//  Created by philips on 11/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import UIKit




class UVProtectionViewController: UIViewController {
    
    

    var uvIndex: Double = 1.0
    var safeTime: Double = 0.0
    
    
    var alertTitle: String  = "Safe Exposure Time"
    var alertMessage: String = ""
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var brownButton: UIButton!
    
    
    @IBOutlet weak var lightBrownButton: UIButton!
    @IBOutlet weak var beigeButton: UIButton!
    
    @IBOutlet weak var darkBrownButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    @IBAction func onCloseTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func beige(_ sender: Any) {
        
        
       safeTime = (200 * 3)/(3 * uvIndex)
        print(safeTime/60)
        
        alertMessage = getAlertMessage(safeTime: safeTime)
        
        let alert = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)

        }
    @IBAction func lightBrown(_ sender: Any) {
        
       safeTime =  (200 * 4)/(3 * uvIndex)
        alertMessage = getAlertMessage(safeTime: safeTime)

        print("uvIndex :\(uvIndex)")
        print("safeTime : \(safeTime/60)")
        let alert = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)

    }
    
    @IBAction func darkBrown(_ sender: Any) {
        
        safeTime = (200 * 8)/(3 * uvIndex)
        alertMessage = getAlertMessage(safeTime: safeTime)

        print(safeTime/60)
        let alert = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)



    }
    @IBAction func black(_ sender: Any) {
        
     safeTime =  (200 * 15)/(3 * uvIndex)
        alertMessage = getAlertMessage(safeTime: safeTime)

        print(safeTime/60)

        let alert = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)

    }
    @IBAction func white(_ sender: Any) {
        
       safeTime =  (200 * 2.5)/(3 * uvIndex)
        alertMessage = getAlertMessage(safeTime: safeTime)

        print(safeTime/60)
        let alert = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)


    }
    @IBAction func brown(_ sender: Any) {
        
        safeTime =  (200 * 5)/(3 * uvIndex)
        alertMessage = getAlertMessage(safeTime: safeTime)

        print(safeTime/60)
        let alert = UIAlertController(title: alertTitle, message:alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //  alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)

    }
    
    
    
    func getUVIndex() {
        
        let headers = [
            "x-access-token": "37670c742b282ccda4621d73fe20ddd1"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.openuv.io/api/v1/uv?lat=-33.34&lng=115.342&dt=2018-01-24T10%3A50%3A52.283Z")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                print("********")
                print(httpResponse?.allHeaderFields)
                let responseData = String(data: data!   , encoding: String.Encoding.utf8)
                print(responseData)
                
                let data = responseData?.data(using: .utf8)
                
                
                
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any]
                    
                    print(json?["result"])
                    if let result = json?["result"] as? [String: Any]{
                        
                        self.uvIndex = Double(truncating: result["uv"] as! NSNumber)
                    }
                    
                    

                    //let dicInFirstElement = json?[0] as? [String: Any]
                    //Pass this json into the following function
                }catch let error{
                    print("eroor")
                }
                
            }
        })
        dataTask.resume()

        
        
    }
    
    func getAlertMessage(safeTime: Double) -> String {
        
        getUVIndex()
        switch uvIndex{
            
        case 0..<(3.0):
            alertMessage = "The UV levels in your region are pretty low. Enjoy the sunshine\n Current UV Index : \(uvIndex)\nSafe Exposure time: \(Int(safeTime/60)) hours"
            
        case 3..<6 :
            
            alertMessage = "The UV levels in your region are moderate. Apply sunscreen and enjoy the sunshine\n Current UV Index : \(uvIndex)\nSafe Exposure time: \(Int(safeTime/60)) hours"
            
            
        case 6..<8 :
            
            alertMessage = "The UV levels in your region high. Apply high SPF suncreen or stay indoors.\n Current UV Index : \(uvIndex)\nSafe Exposure time: \(Int(safeTime/60)) hours"
        case 8..<11:
            
            alertMessage = "The UV levels in your region are ver high. Stay indoors\n Current UV Index : \(uvIndex)\nSafe Exposure time: \(Int(safeTime/60)) hours"
            
        default :
            
            alertMessage = "UV Levels extremely high: Consult a dermatologist\n Current UV Index : \(uvIndex)\nSafe Exposure time: \(Int(safeTime/60)) hours"
        }
        
        return alertMessage
        
    }
    
    
    
    
    override func viewDidLoad() {
        
        getUVIndex()
        
      
        
      
    }
    
}

