//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Emmett Shaughnessy on 11/8/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    @IBOutlet weak var tipTotal: UILabel!
    @IBOutlet weak var finalTotal: UILabel!
    
    var tipAmount:Double = 0.15
    var originalBill:Double = 0.0{
        didSet{
            let step1tip = originalBill*tipAmount
            let roundedTip:String = String(format: "%0.2f",step1tip)
            let roundedBill:String = String(format: "%0.2f",originalBill)
            
            total = ((Double(roundedBill)!+Double(roundedTip)!))
            if !(billAmount.text?.contains("$"))!{
                billAmount.text = "$\(billAmount.text!)"
            }
            print("""
                  
                  ––––––––––––––––––––––––––––––––
                  Original Bill: $\(roundedBill)
                  Tip Percent:    \( Int((tipAmount)*100) )%
                  Tip Rounded:    \(roundedTip)
                  Total:          \(total)
                  ––––––––––––––––––––––––––––––––
                  """)
            
            updateDisplay()
        }//end didSet
    }
    var total:Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func beginEditingBill(_ sender: Any) {
        if (billAmount.text?.contains("$"))!{
            let newString = billAmount.text?.replacingOccurrences(of: "$", with: "")
            billAmount.text = "\(newString!)"
        }
    }
    
    @IBAction func doneEditingBill(_ sender: Any) {
        if billAmount.text != "" && billAmount.text != nil {
            let newString = billAmount.text?.replacingOccurrences(of: "$", with: "")
            originalBill = (newString!.toDouble())!
        }else{
            tipTotal.text = "$0.00"
            tipTotal.textColor = UIColor.placeholderText
            finalTotal.text = "$0.00"
            finalTotal.textColor = UIColor.placeholderText
        }
        //print(originalBill)
    }

    
    @IBAction func didChangeTip(_ sender: UISegmentedControl) {
        switch tipSegment.selectedSegmentIndex{
            case 0:
                //print("Tip: 15%")
                tipAmount = 0.15
            case 1:
                //print("Tip: 18%")
                tipAmount = 0.18
            case 2:
                //print("Tip: 20%")
                tipAmount = 0.20
            case 3:
                //print("Tip: 25%")
                tipAmount = 0.25
            default:
                break
        }
        
        if billAmount.text == "" || billAmount.text == nil {
            tipTotal.text = "$0.00"
            tipTotal.textColor = UIColor.placeholderText
            finalTotal.text = "$0.00"
            finalTotal.textColor = UIColor.placeholderText
        }else{
            updateDisplay()
        }
    }
    
    
    func updateDisplay(){
        let step1tip = originalBill*tipAmount
        let roundedTip:String = String(format: "%0.2f",step1tip)
        
        let roundedBill:String = String(format: "%0.2f",originalBill)
        
        total = ((Double(roundedBill)!+Double(roundedTip)!))
        
        tipTotal.text = "\(roundedTip)"
        tipTotal.textColor = UIColor.black
        finalTotal.text = "\(total)"
        finalTotal.textColor = UIColor.black
        
    }
    

    @IBAction func resetPressed(_ sender: Any) {
        billAmount.text = ""
                
        tipTotal.text = "$0.00"
        tipTotal.textColor = UIColor.placeholderText
        finalTotal.text = "$0.00"
        finalTotal.textColor = UIColor.placeholderText
    }
    
}

