//
//  NetworkOperation.swift
//  ArcticRun-iPad
//
//  Created by Jacky Lui on 2016-02-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import Foundation

class Download{
    lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    lazy var session: NSURLSession = NSURLSession(configuration: self.config)
    
    let queryURL: NSURL
    
    init(url:NSURL){
        self.queryURL = url
    }
    
    func downloadJSONFromURL(completion: (String?) -> Void){
        let request = NSURLRequest(URL: queryURL)
        
        let dataTask = session.dataTaskWithRequest(request){
            (let data, let response, let error) in
            
            if let httpResponse = response as? NSHTTPURLResponse{
                
                if(httpResponse.statusCode == 200){
                    do {
                        let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [AnyObject]
                        completion(jsonResult[0]["key"] as? String)
                        
                    } catch let error {
                        print("JSON Serialization failed. Error: \(error)")
                    }
                } else{
                    print("get request not successful. \(httpResponse.statusCode)")
                }
            } else{
                print("error")
            }
        }
        
        dataTask.resume()
    }
    
}