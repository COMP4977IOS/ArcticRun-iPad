//

//  SecondViewController.swift

//  ArcticRun-iPad

//

//  Created by Jacky Lui on 2016-02-04.

//  Copyright © 2016 COMP 4977. All rights reserved.

//



import UIKit
import Charts
import CloudKit

class SecondViewController: UIViewController, ChartViewDelegate {
    
    var db:CKDatabase!
    
    @IBOutlet weak var txtField: UITextView!
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var xaxis:[String] = []
    var caloriesList:[Double] = []
    
    //https://api.mongolab.com/api/1/databases/iios-test/collections/test?apiKey=xEK9erNjPFK-LYCckhJiNXtyY2Ccoadr
    
    //let URL = NSURL(string: "https://api.mongolab.com/api/1/databases/iios-test/collections/test?apiKey=xEK9erNjPFK-LYCckhJiNXtyY2Ccoadr");
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get database
        
        db = CKContainer(identifier: "iCloud.com.terratap.arcticrun").publicCloudDatabase
        self.loadCloudData()
        
        // Configure look and feel of graph view
        self.lineChartView.delegate = self
        self.lineChartView.descriptionText = "Tap node for details"
        self.lineChartView.descriptionTextColor = UIColor.blueColor()
        self.lineChartView.gridBackgroundColor = UIColor.darkGrayColor()
        self.lineChartView.noDataText = "No data provided"
        
        //toggle the menu bar
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    // Returns the finished graph data to view
    func getChartData(xData : [String], yData : [Double]) -> LineChartData {
        // Creating an array of data entries from the x and y values
        var yVals1 : [ChartDataEntry] = [ChartDataEntry]()
        for var i = 0; i < xData.count; i++ {
            yVals1.append(ChartDataEntry(value: yData[i], xIndex: i))
        }
        
        // Create a data set with our array
        let set: LineChartDataSet = LineChartDataSet(yVals: yVals1, label: "Calories Burned")
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
        let data: LineChartData = LineChartData(xVals: xaxis, dataSets: dataSets)
        data.setValueTextColor(UIColor.blackColor())
        return data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCloudData(){
        let predicate:NSPredicate = NSPredicate(value: true)
        let query:CKQuery = CKQuery(recordType: "Workout", predicate: predicate)
        var rec:Int = 0
        //create records variable with query.
        db.performQuery(query, inZoneWithID: nil) { (records:[CKRecord]?, error:NSError?) -> Void in
            if error != nil || records == nil{
                return  //found errors
            }
            //to make sure we show 10 inputs.
            if(records?.count > 10){
                rec = records!.count - 10
                print(rec)
            }
            
            //run through records, populating Date + calories burned for x and y axis.
            
            for var i = rec; i < records?.count; i++ {
                let record:CKRecord = records![i]
                let date:NSDate = record.objectForKey("startDate") as! NSDate
                let calories:Double = record.objectForKey("caloriesBurned") as! Double
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = .MediumStyle
                let string = dateFormatter.stringFromDate(date)
                
                self.xaxis.append(string)
                self.caloriesList.append(calories)
            }
            
            // Retrieve graph data
            self.lineChartView.data = self.getChartData(self.xaxis, yData: self.caloriesList)
        }
    }
}

