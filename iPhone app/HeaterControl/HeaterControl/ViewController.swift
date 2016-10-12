//
//  ViewController.swift
//  HeaterControl
//
//  Created by Clayton, Bradley (AU - Melbourne) on 13/10/2016.
//  Copyright © 2016 Clayton, Bradley (AU - Melbourne). All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        Alamofire.request("https://api.particle.io/v1/devices/510028000b51343334363138/temp?access_token=d2d8eab7d7cecfbc33b225c620b939b371b0ed9e").responseJSON { response in

        
            if (response.result.isSuccess) {
                if let json = response.result.value {
                    debugPrint("JSON: \(json)")
                    let info = json as! NSDictionary
                    if let temp = info.value(forKey: "result") as? String {
                        debugPrint(temp);
                        self.tempLabel.text = temp + "° C";
                    }
                }
                
                
            }
            
            
        }
    }
}

