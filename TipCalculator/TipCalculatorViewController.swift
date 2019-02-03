//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Arman Momin on 1/31/19.
//  Copyright © 2019 armanmomin. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController
{
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var splitNumberSlider: UISlider!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountField.becomeFirstResponder()
    }
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.billAmount = (billAmountField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(splitNumberSlider.value)
        eachPersonAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    
    // MARK: - Target / Action
    
    @IBAction func tipSliderValueChanged(sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    
    @IBAction func numberOfPeopleSliderValueChanged(sender: Any) {
        splitNumberLabel.text = "Slit: \(Int(splitNumberSlider.value))"
        calculateBill()
    }
    @IBAction func amountBeforeTaxTextFieldChanged(_ sender: Any) {
        calculateBill()
    }
    
}
