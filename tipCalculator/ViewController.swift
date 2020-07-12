//  ViewController.swift
//  tipCalculator

//  Created by Jennifer Lopez on 7/9/20.
//  Copyright © 2020 Jennifer Lopez. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BillAmt: UITextField!
    @IBOutlet weak var tipSlide: UISlider!
    @IBOutlet weak var splitSlide: UISlider!
    @IBOutlet weak var tipOut: UILabel!
    @IBOutlet weak var splitOut: UILabel!
    @IBOutlet weak var tipValue: UILabel!
    @IBOutlet weak var totalValue: UILabel!
    @IBOutlet weak var SplitView: UIView!
    @IBOutlet weak var splitTip: UILabel!
    @IBOutlet weak var totalSplit: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.SplitView.layer.cornerRadius = 10
        self.SplitView.layer.masksToBounds = true
        self.SplitView.isHidden = true
        self.BillAmt.keyboardType = .decimalPad
    }
    
    @IBAction func onTap(_ sender: Any) { dismissKeyboard()}
    
    @objc func dismissKeyboard()
      {view.endEditing(true)}
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(BillAmt.text!) ?? 0
        let tip =  Double(round(tipSlide.value)/100) * bill
        
        tipValue.text = String(format: "$%.2f%", tip)
        totalValue.text = String(format: "$%.2f%", tip+bill)
        
        if (splitSlide.value != 0 && bill != 0) {
            self.SplitView.isHidden = false
            let people = Int(splitSlide.value)+1
            let splitTipVal = tip/Double(people)
            let totalSplitVal = (bill + tip)/Double(people)

            splitTip.text = String(format: "$%.2f%", splitTipVal)
            totalSplit.text = String(format: "$%.2f%", totalSplitVal)
        }
        else {
            self.SplitView.isHidden = true
        }
    }
    
    @IBAction func tipSlider(_ sender: Any) {
        tipOut.text = String(format: "%.0f%%", tipSlide.value)
        calculateTip(sender)
    }
    
    @IBAction func splitSlider(_ sender: Any) {
        splitOut.text = String(format: "%.0f%", splitSlide.value)
        calculateTip(sender)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}
