//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Luis Franco R on 25/10/2018.
//  Copyright © 2018 Luis Franco R. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 0.10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTextField.becomeFirstResponder()
    }
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(Int(tipPercentageSlider.value)) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPersonAmountLabel.text = String( format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    


    // MARK: - Target / Actions
    
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    
    @IBAction func numberOfPeopleSliderValueChanged(_ sender: Any) {
        numberOfPeopleLabel.text = String(format: "Split: \(Int(numberOfPeopleSlider.value))")
        calculateBill()
    }
    
    @IBAction func amountBeforeTaxtTextfieldChanged(_ sender: Any) {
        calculateBill()
    }
}

