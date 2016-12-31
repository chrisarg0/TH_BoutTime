//
//  CompletedGameVC.swift
//  BoutTime
//
//  Created by Chris Argonish on 12/27/16.
//  Copyright © 2016 Chris. All rights reserved.
//

import UIKit

class CompletedGameVC: UIViewController {
    
    @IBOutlet weak var gameScoreLabel: UILabel!
        
        var endGameScore: String!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            gameScoreLabel.text = endGameScore
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
}
