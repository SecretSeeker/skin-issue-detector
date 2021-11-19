//
//  StartViewController.swift
//  hackathon_ml
//
//  Created by philips on 11/07/19.
//  Copyright © 2019 philips. All rights reserved.
//

import Foundation
import UIKit


struct SkinData {
    let backgroundImgName:String!
    let title:String!
    let description:String!
}
class StartViewController: UIViewController {
    @IBOutlet weak var lesionButton: UIButton!
    @IBOutlet weak var uvButton: UIButton!
    @IBOutlet weak var diseaseButton: UIButton!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureTableCellItems()

            configUI()
        
    }
    
    func configUI(){
        
        lesionButton.layer.cornerRadius = 5.0
        uvButton.layer.cornerRadius = 5.0
        diseaseButton.layer.cornerRadius = 5.0
        view.backgroundColor = UIColor.init(red: 153/255, green: 1.0, blue: 1.0, alpha: 1.0)

    }
    
    func configureTableCellItems(){
        
        let skinData1 = SkinData(backgroundImgName: "backgroundImg_1", title: "Skin Analyze", description:"abc")
        let skinData2 = SkinData(backgroundImgName: "backgroundImg_2", title: "Skin diseases",description:"abc")
        let skinData3 = SkinData(backgroundImgName: "backgroundImg_3", title: "U/v", description:"abc")

        
    }
    
    func updateCellUI(_ cell: SelectionCell){
        
        
        
    }

    
}

    
    

