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
    
    @IBOutlet var lbl_totalCal: UILabel!
    @IBOutlet var lbl_totalDist: UILabel!
    @IBOutlet var lbl_totalSteps: UILabel!
    
    var xaxis:[String] = []
    var caloriesList:[Double] = []
    
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
        self.lineChartView.noDataText = "Click to load data."
        //Configure looks of labels
        lbl_totalCal.font = lbl_totalCal.font.fontWithSize(26)
        lbl_totalDist.font = lbl_totalDist.font.fontWithSize(26)
        lbl_totalSteps.font = lbl_totalSteps.font.fontWithSize(26)
        
        let predicate:NSPredicate = NSPredicate(value: true)
        let query:CKQuery = CKQuery(recordType: "Workout", predicate: predicate)
        var rec:Int = 0
        var totalCalories:Double = 0
        var totalDistance:Double = 0
        var totalSteps:Double = 0
        
        //create records variable with query.
        db.performQuery(query, inZoneWithID: nil) { (records:[CKRecord]?, error:NSError?) -> Void in
            if error != nil || records == nil{
                return  //found errors
            }
            //to make sure we show 10 inputs.
            if(records?.count > 10){
                rec = records!.count - 10
            }
            
            for var i = rec; i < records?.count; i++ {
                let record:CKRecord = records![i]
                let date:NSDate = record.objectForKey("startDate") as! NSDate
                let calories:Double = record.objectForKey("caloriesBurned") as! Double
                let distance:Double = record.objectForKey("distance") as! Double
                var steps:Double = 0
                
                if record.objectForKey("steps") != nil {
                    steps = record.objectForKey("steps") as! Double
                }
                
                totalCalories += calories
                totalDistance += distance
                totalSteps += steps
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = .MediumStyle
                let string = dateFormatter.stringFromDate(date)
                
                self.xaxis.append(string)
                self.caloriesList.append(calories)
            }
            
            self.lbl_totalCal.text = "Total Calories Burned: " + String(totalCalories)
            self.lbl_totalDist.text = "Total Distance Run: " + String(totalDistance) + "m"
            self.lbl_totalSteps.text = "Total Steps Taken: " + String(totalSteps)
            //self.updatelabels(totalCalories, dist: totalDistance)
            
            self.lineChartView.data = self.getChartData(self.xaxis, yData: self.caloriesList)
        }
        
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
    }

}

