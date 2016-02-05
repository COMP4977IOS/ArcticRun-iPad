//
//  SecondViewController.swift
//  ArcticRun-iPad
//
//  Created by Jacky Lui on 2016-02-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    //https://api.mongolab.com/api/1/databases/iios-test/collections/test?apiKey=xEK9erNjPFK-LYCckhJiNXtyY2Ccoadr
    
    let URL = NSURL(string: "https://api.mongolab.com/api/1/databases/iios-test/collections/test?apiKey=xEK9erNjPFK-LYCckhJiNXtyY2Ccoadr");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let download = Download(url: URL!)
        
        download.downloadJSONFromURL(){
            (let val) in
            if let text = val{
                //update UI
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    //execute closure
                    self.label.text = text
                })
            
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

