//
//  ViewController.swift
//  AgeCalculate
//
//  Created by apple on 3/22/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var EnterView: UIView!
    @IBOutlet weak var AgeView: UIView!
    @IBOutlet weak var ExtraView: UIView!
    @IBOutlet weak var getAge: UITextField!
    @IBOutlet weak var countOutlet: UIButton!
    @IBOutlet weak var AgeYearLabel: UILabel!
    @IBOutlet weak var AgeMonthsLabel: UILabel!
    @IBOutlet weak var AgeDayLabel: UILabel!
    @IBOutlet weak var ExtraYearLabel: UILabel!
    @IBOutlet weak var ExtraMonthsLabel: UILabel!
    @IBOutlet weak var ExtraWeeksLabel: UILabel!
    @IBOutlet weak var ExtraDayLabel: UILabel!
    @IBOutlet weak var ExtraHoursLabel: UILabel!
    @IBOutlet weak var ExtraMinutesLabel: UILabel!
    @IBOutlet weak var ExtraSecondLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ageEditView()
    }
    
    func ageEditView(){
        EnterView.layer.cornerRadius = 8
        AgeView.layer.cornerRadius = 8
        ExtraView.layer.cornerRadius = 8
        countOutlet.layer.cornerRadius = 8
    }
    
    func getAgeFromDOF(date: String) -> (Int,Int,Int) {

        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM-dd-yyyy"
        let dateOfBirth = dateFormater.date(from: date)

        let calender = Calendar.current

        let dateComponent = calender.dateComponents([.month, .day, .year], from:
        dateOfBirth!, to: Date())

        return (dateComponent.year!, dateComponent.month!, dateComponent.day!)
    }
    
    func getAgeAll()  {
       let dateFormatter = DateFormatter()
       dateFormatter.locale = Locale(identifier: "en_US_POSIX")
       dateFormatter.dateFormat = "MM-dd-yyyy"
       if let date = dateFormatter.date(from: getAge.text!) {
           let year = Calendar.current.dateComponents([.year], from: date, to: Date()).year!
        ExtraYearLabel.text = "\(year)"
           let month = Calendar.current.dateComponents([.month], from: date, to: Date()).month!
        ExtraMonthsLabel.text = "\(month)"
           let weeks = Calendar.current.dateComponents([.weekOfYear], from: date, to: Date()).weekOfYear!
        ExtraWeeksLabel.text = "\(weeks)"
           let day = Calendar.current.dateComponents([.day], from: date, to: Date()).day!
        ExtraDayLabel.text = "\(day)"
           let hour = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour!
        ExtraHoursLabel.text = "\(hour)"
           let minute = Calendar.current.dateComponents([.minute], from: date, to: Date()).minute!
        ExtraMinutesLabel.text = "\(minute)"
           let second = Calendar.current.dateComponents([.second], from: date, to: Date()).second!
        ExtraSecondLabel.text = "\(second)"
       }
        
        
    }
    
    
    @IBAction func AgeCount(_ sender: UIButton) {
        //age show
        let age  = getAgeFromDOF(date: getAge.text!)
        AgeYearLabel.text = "\(age.0)"
        AgeMonthsLabel.text = "\(age.1)"
        AgeDayLabel.text = "\(age.2)"
        
        getAgeAll()
        
    }
    
}

