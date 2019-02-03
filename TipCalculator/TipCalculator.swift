//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Arman Momin on 2/1/19.
//  Copyright © 2019 armanmomin. All rights reserved.
//

import Foundation

class TipCalculator {
    var billAmount: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(amountBeforeTax: Double, tipPercentage: Double) {
        self.billAmount = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = billAmount * tipPercentage
        totalAmount = tipAmount + billAmount
    }
}
