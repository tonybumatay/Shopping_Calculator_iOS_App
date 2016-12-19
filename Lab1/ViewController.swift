//
//  ViewController.swift
//  Lab1
//
//  Created by Tony Bumatay on 9/13/16.
//  Copyright © 2016 Tony Bumatay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originalPrice: UITextField!
    
    @IBOutlet weak var discountPct: UITextField!
    
    @IBOutlet weak var salesTax: UITextField!
    
    @IBOutlet weak var finalPrice: UILabel!
    
    @IBOutlet weak var advice: UILabel!
    
    var currencyFormatter = NSNumberFormatter()
    var currencySymbol: String!
    
    var myFinalPrice = 0.0
    var myOriginalPrice = 0.0
    var myDiscountPct = 0.0
    var mySalesTax = 0.0
    var myAdvice = "_______________"
    
    
    @IBAction func editOriginalPrice(sender: UITextField) {
        myOriginalPrice = (originalPrice.text! as NSString).doubleValue
        if myOriginalPrice < 0.0 {
            myOriginalPrice = 0.0
        }
        calculate()
    }
    
    @IBAction func editDiscountPct(sender: UITextField) {
        myDiscountPct = (discountPct.text! as NSString).doubleValue/100
        if myDiscountPct < 0.0 {
            myDiscountPct = 0.0
        } else if myDiscountPct > 1{
            myDiscountPct = 1.0
        }
        calculate()
        giveAdvice()
    }
    
    @IBAction func editSalesTax(sender: UITextField) {
        mySalesTax = (salesTax.text! as NSString).doubleValue/100
        if mySalesTax < 0.0 {
            mySalesTax = 0.0
        }
        calculate()
    }
   
    func calculate () {
        var preTax =  myOriginalPrice * (1 - myDiscountPct)
        var myFinalPrice = preTax + (preTax * mySalesTax)
        print("myFinalPrice is : ", String(format: "%.2f", myFinalPrice))
        finalPrice.text = "$" + String(format: "%.2f", myFinalPrice)
    }
    
    func giveAdvice () {
        if myDiscountPct < 0.1 {
            myAdvice = "C'mon, man. I'm a starving college kid!"
        } else if myDiscountPct < 0.25{
            myAdvice = "I've seen better sales.."
        } else if myDiscountPct < 0.4 {
            myAdvice = "Now we're starting to do some business"
        } else if myDiscountPct < 0.5000001 {
            myAdvice = "I'll talke it!"
        } else if myDiscountPct < 0.65 {
            myAdvice = "Over 50% off :D"
        } else if myDiscountPct < 0.8 {
            myAdvice = "This is what dreams are made of!"
        } else if myDiscountPct < 0.99999999 {
            myAdvice = "This is like stealing candy from a baby."
        } else {
            myAdvice = "It's literally free.."
        }
        advice.text = myAdvice
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

