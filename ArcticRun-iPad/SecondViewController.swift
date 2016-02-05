//
//  SecondViewController.swift
//  ArcticRun-iPad
//
//  Created by Jacky Lui on 2016-02-04.
//  Copyright © 2016 COMP 4977. All rights reserved.
//

import UIKit
import Charts

class SecondViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var label: UILabel!
    
    let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    let calories = [1453.0,2352,5431,1442,5451,6486,1173,5678,9234,1345,9411,2212]
    
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
            
        // Configure look and feel of graph view
        lineChartView.delegate = self
        lineChartView.descriptionText = "Tap node for details"
        lineChartView.descriptionTextColor = UIColor.blueColor()
        lineChartView.gridBackgroundColor = UIColor.darkGrayColor()
        lineChartView.noDataText = "No data provided"
        
        // Retrieve graph data
        lineChartView.data = self.getChartData(months, yData: calories)
    }
    
    /*
    * Returns the finished graph data to view
    */
    func getChartData(xData : [String], yData : [Double]) -> LineChartData {
        // Creating an array of data entries from the x and y values
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for var i = 0; i < xData.count; i++ {
            yVals1.append(ChartDataEntry(value: yData[i], xIndex: i))
        }
        
        // Create a data set with our array
        let set: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "First Set")
        set.axisDependency = .Left // Line will correlate with left axis values
        set.setColor(UIColor.redColor().colorWithAlphaComponent(0.5)) // our line's opacity is 50%
        set.setCircleColor(UIColor.redColor())
        set.lineWidth = 2.0
        set.circleRadius = 6.0 // the radius of the node circle
        set.fillAlpha = 65 / 255.0
        set.fillColor = UIColor.redColor()
        set.highlightColor = UIColor.greenColor()
        set.drawCircleHoleEnabled = true
        
        // Update the list of datasets
        var dataSets : [LineChartDataSet] = [LineChartDataSet]()
        dataSets.append(set);
        
        // Pass our months in for our x-axis label value along with our dataSets
        let data: LineChartData = LineChartData(xVals: months, dataSets: dataSets)
        data.setValueTextColor(UIColor.blackColor())
        
        return data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

