//
//  ViewController.swift
//  calculator
//
//  Created by Alehandro on 9.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    //MARK: -
    
    @IBOutlet weak var calculatingLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var commaButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    private var calculatingNumber: String = "0"
    private var globalNumber: Double = 0
    private var plusNumber: Double = 0
    private var minusNumber: Double = 0
    private var multiplyNumber: Double = 0
    private var divideNumber: Double = 0
    
    //MARK: - ViewController Lifecicle
    //MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .black
        calculatingLabel.text = calculatingNumber
        cornerRadius()
    }
    
    //MARK: - Actions
    //MARK: -
    
    @IBAction func onCancelButton(_ sender: Any) {
        calculatingNumber = "0"
        plusNumber = 0
        minusNumber = 0
        multiplyNumber = 0
        divideNumber = 0
        calculatingLabel.text = calculatingNumber
    }
    @IBAction func onChangeButton(_ sender: Any) {
        if calculatingNumber.contains("-") {
            calculatingNumber.remove(at: calculatingNumber.startIndex)
            calculatingLabel.text = calculatingNumber
        } else {
            calculatingNumber.insert("-", at: calculatingNumber.startIndex)
            calculatingLabel.text = calculatingNumber
        }
    }
    @IBAction func onPercentButton(_ sender: Any) {
        var calcNum = Double(calculatingNumber)
        let num: Double = 100
        calcNum! /= num
        calculatingNumber = String(calcNum!)
        calculatingLabel.text = calculatingNumber
    }
    @IBAction func onZeroButton(_ sender: Any) {
        onButtons(numberOfButton: "0")
    }
    @IBAction func onOneButton(_ sender: Any) {
        onButtons(numberOfButton: "1")
    }
    @IBAction func onTwoButton(_ sender: Any) {
        onButtons(numberOfButton: "2")
    }
    @IBAction func onThreeButton(_ sender: Any) {
        onButtons(numberOfButton: "3")
    }
    @IBAction func onFourButton(_ sender: Any) {
        onButtons(numberOfButton: "4")
    }
    @IBAction func onFiveButton(_ sender: Any) {
        onButtons(numberOfButton: "5")
    }
    @IBAction func onSixButton(_ sender: Any) {
        onButtons(numberOfButton: "6")
    }
    @IBAction func onSevenButton(_ sender: Any) {
        onButtons(numberOfButton: "7")
    }
    @IBAction func onEightButton(_ sender: Any) {
        onButtons(numberOfButton: "8")
    }
    @IBAction func onNineButton(_ sender: Any) {
        onButtons(numberOfButton: "9")    }
    @IBAction func onCommaButton(_ sender: Any) {
        if calculatingNumber == "0" {
            calculatingNumber = "0"
            calculatingLabel.text = calculatingNumber
        } else if calculatingNumber.contains(".") {
            calculatingLabel.text = calculatingNumber
        } else {
            calculatingNumber += "."
            calculatingLabel.text = calculatingNumber
        }
    }
    @IBAction func onDivideButton(_ sender: Any) {
    }
    @IBAction func onMultiplyButton(_ sender: Any) {
    }
    @IBAction func onMinusButton(_ sender: Any) {
        if minusNumber == 0 {
            minusNumber += Double(calculatingNumber)!
            
            globalNumber = Double(calculatingNumber)!   ///
            calculatingNumber = "0"
            print(minusNumber, globalNumber)
            print("11")
        } else if minusNumber == globalNumber {
            let someNumber = Double(calculatingNumber)!
            calculatingNumber = "0"
            minusNumber -= someNumber
            calculatingLabel.text = String(minusNumber)
            globalNumber = minusNumber // Double(calculatingNumber)!
            print(minusNumber, globalNumber)
            print("22")
        } else {
            calculatingNumber = "0"
            plusNumber -= Double(calculatingNumber)!
            calculatingLabel.text = String(minusNumber)
            globalNumber = minusNumber // Double(calculatingNumber)!
            print(minusNumber, globalNumber)
            print("33")
        }
    }
    @IBAction func onPlusButton(_ sender: Any) {
        if plusNumber > 0 {
        }
        if plusNumber == 0 {
            plusNumber += Double(calculatingNumber)!
            
            globalNumber = Double(calculatingNumber)!   ///
            calculatingNumber = "0"
            print(plusNumber, globalNumber)
            print("1")
        } else if plusNumber == globalNumber {
            let someNumber = Double(calculatingNumber)!
            calculatingNumber = "0"
            plusNumber += someNumber
            calculatingLabel.text = String(plusNumber)
            globalNumber = plusNumber // Double(calculatingNumber)!
            print(plusNumber, globalNumber)
            print("2")
        } else {
            calculatingNumber = "0"
            plusNumber += Double(calculatingNumber)!
            calculatingLabel.text = String(plusNumber)
            globalNumber = plusNumber // Double(calculatingNumber)!
            print(plusNumber, globalNumber)
            print("3")
        }
    }
    @IBAction func onEqualButton(_ sender: Any) {
        if plusNumber > 0 {
            if globalNumber == 0 {
                plusNumber += Double(calculatingNumber)!
                calculatingLabel.text = String(plusNumber)
                print("1.1")
            } else if calculatingNumber == "0" {
                let someNumber = globalNumber
                plusNumber += someNumber
                calculatingLabel.text = String(plusNumber)
                print("1.2")
            } else {
                plusNumber += Double(calculatingNumber)!
                calculatingLabel.text = String(plusNumber)
                print("1.3")
            }
            print(plusNumber, globalNumber)
        }
        
        if minusNumber != 0 {
            if globalNumber == 0 {
                minusNumber += Double(calculatingNumber)!
                calculatingLabel.text = String(plusNumber)
                print("1.11")
            } else if calculatingNumber == "0" {
                let someNumber = globalNumber
                minusNumber -= someNumber
                calculatingLabel.text = String(minusNumber)
                if minusNumber == 0 {
                    minusNumber -= globalNumber
                    calculatingLabel.text = String(minusNumber)
                }
                print("1.22")
            } else {
                minusNumber -= Double(calculatingNumber)!
                calculatingLabel.text = String(minusNumber)
                print("1.33")
            }
            print(minusNumber, globalNumber)
        }
    }
    
    //MARK: - Private functions
    //MARK: -
    
    private func cornerRadius() {
        let cornerRadius: CGFloat = 40
        cancelButton.layer.cornerRadius = cornerRadius
        changeButton.layer.cornerRadius = cornerRadius
        percentButton.layer.cornerRadius = cornerRadius
        zeroButton.layer.cornerRadius = cornerRadius
        oneButton.layer.cornerRadius = cornerRadius
        twoButton.layer.cornerRadius = cornerRadius
        threeButton.layer.cornerRadius = cornerRadius
        fourButton.layer.cornerRadius = cornerRadius
        fiveButton.layer.cornerRadius = cornerRadius
        sixButton.layer.cornerRadius = cornerRadius
        sevenButton.layer.cornerRadius = cornerRadius
        eightButton.layer.cornerRadius = cornerRadius
        nineButton.layer.cornerRadius = cornerRadius
        commaButton.layer.cornerRadius = cornerRadius
        divideButton.layer.cornerRadius = cornerRadius
        multiplyButton.layer.cornerRadius = cornerRadius
        minusButton.layer.cornerRadius = cornerRadius
        plusButton.layer.cornerRadius = cornerRadius
        equalButton.layer.cornerRadius = cornerRadius
    }
    
    private func onButtons (numberOfButton: String) {
        if calculatingNumber == "0" {
            calculatingNumber = numberOfButton
            calculatingLabel.text = calculatingNumber
        } else {
            calculatingNumber += numberOfButton
            calculatingLabel.text = calculatingNumber
        }
    }
    
}

