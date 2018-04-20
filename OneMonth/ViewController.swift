//
//  ViewController.swift
//  OneMonth
//
//  Created by Krassi on 4/19/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstPicker: UIDatePicker!
    @IBOutlet weak var secondPicker: UIDatePicker!
    @IBOutlet weak var outputLabel: UILabel!
    
    
    @IBAction func newSelection(_ sender: UIDatePicker) {
        outputLabel.text = oneMonthDifference(firstDate: firstPicker.date, nextDate: secondPicker.date) ? "Yes" : "No"
    }
    
    func components(date:Date) -> (Int,Int,Int) {
        let calendar = Calendar.current
        return (
            calendar.component(.year, from: date),
            calendar.component(.month, from: date),
            calendar.component(.day, from: date)
        )
    }
    
    func oneMonthDifference(firstDate:Date, nextDate:Date) -> Bool {
        let (Y1,M1,D1) = components(date: firstDate)
        let (Y2,M2,D2) = components(date: nextDate)

        if D1 != D2 { return false }
        if abs(M2 - M1) == 1 && Y1 == Y2 { return true }
        if Y2 - Y1 == 1 && M2 == 1 && M1 == 12 { return true }
        if Y1 - Y2 == 1 && M2 == 12 && M1 == 1 { return true }
        return false
    }
}

