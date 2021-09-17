//
//  CalculatorViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    //@IBOutlet var digitButtons: [UIButton]!
    
    var firstNumber: Double = 0.0
    var operation: String = ""
    let operations = MathOperations()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private var isTyping: Bool = false
        
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        let digit = String(sender.tag)
        let displayText = resultLabel.text ?? ""

        
        if isTyping {
            resultLabel.text = displayText + digit
        } else {
            resultLabel.text = digit
            isTyping.toggle()
        }
    }
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        let value = NSString(string: resultLabel.text ?? "0").doubleValue
        
        switch sender.tag {
        case 16:                                         //Square Button Tapped
            resultLabel.text = String(sqrt(value))
        case 10:                                        //Add Button Tapped
            firstNumber = value
            operation = "plus"
            resultLabel.text = ""
        case 11:                                        //Minus Button Tapped
            firstNumber = value
            operation = "minus"
            resultLabel.text = ""
        case 12:                                        //Multiply Button Tapped
            firstNumber = value
            operation = "multiply"
            resultLabel.text = ""
        case 13:                                        //Divide Button Tapped
            firstNumber = value
            operation = "divide"
            resultLabel.text = ""
        case 14:
            switch operation {
            case "plus":
                resultLabel.text = operations.Addition(firstValue: firstNumber, secondValue: value)
            case "minus":
                resultLabel.text = operations.Subtract(firstValue: firstNumber, secondValue: value)
            case "multiply":
                resultLabel.text = operations.Multiply(firstValue: firstNumber, secondValue: value)
            case "divide":
                resultLabel.text = operations.Divide(firstValue: firstNumber, secondValue: value)
            default:
                resultLabel.text = "ERROR"
            }
        case 15:
            resultLabel.text = ""
            firstNumber = 0

        default:
            resultLabel.text = "ERROR"
        }

        /*if sender.tag == 0 {
            resultLabel.text = String(sqrt(value))
        }
        else if sender.tag == 10 {
            firstNumber = value
            operation = "plus"
            resultLabel.text = ""
        }
        else if sender.tag == 11 {
            isOperationButtonTapped.toggle()
            firstNumber = value
            operation = "minus"
            resultLabel.text = ""
        }
        else if sender.tag == 12 {
            isOperationButtonTapped.toggle()
            firstNumber = value
            operation = "multiply"
            resultLabel.text = ""
        }
        else if sender.tag == 13 {
            firstNumber = value
            isOperationButtonTapped.toggle()
            operation = "divide"
            resultLabel.text = ""
        }
        else if sender.tag == 14 {
            
            switch operation {
            case "plus":
                resultLabel.text = operations.Addition(firstValue: firstNumber, secondValue: value)
            case "minus":
                resultLabel.text = operations.Subtract(firstValue: firstNumber, secondValue: value)
            case "multiply":
                resultLabel.text = operations.Multiply(firstValue: firstNumber, secondValue: value)
            case "divide":
                resultLabel.text = operations.Divide(firstValue: firstNumber, secondValue: value)
            default:
                resultLabel.text = "ERROR"
            }
            
        }
 */
    }
    
    

}
