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
    
    var tipAmount:Double = 0.0
    var originalBill:Double = 0.0
    var total:Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneEditingBill(_ sender: Any) {
        originalBill = (billAmount.text as? Double)!
        print(originalBill)
    }

    
    @IBAction func didChangeTip(_ sender: UISegmentedControl) {
        switch tipSegment.selectedSegmentIndex{
            case 0:
                print("Tip: 15%")
                tipAmount = 0.15
            case 1:
                print("Tip: 18%")
                tipAmount = 0.18
            case 2:
                print("Tip: 20%")
                tipAmount = 0.20
            case 3:
                print("Tip: 25%")
                tipAmount = 0.25
            default:
                break
        }
    }
    


}

