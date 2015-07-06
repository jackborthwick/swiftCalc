//
//  ViewController.swift
//  swiftCalc
//
//  Created by Jack Borthwick on 7/6/15.
//  Copyright (c) 2015 Jack Borthwick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel : UILabel!
    var pressedDecimal = false
    var oldOperatingAmount = Float()
    var sum = Float(0)
    var equalsPressed = false
    //-------------------------interactivity methods-----------------------
    var operand = ""
    
    @IBAction func digitPressed(send: UIButton) {
        //println("digit pressed")
        if (equalsPressed == true) {
            myLabel.text = ""
        }
        equalsPressed = false
        if send.titleLabel!.text! == "AC" {
            myLabel.text = ""
            pressedDecimal = false
        }
        else {
            if send.titleLabel!.text! == "." {
                if (!pressedDecimal) {
                    pressedDecimal = true
                    myLabel.text = myLabel.text! + send.titleLabel!.text!
                }
            }
            else {
                myLabel.text = myLabel.text! + send.titleLabel!.text!
            }
        }
    }
    
    @IBAction func operatorPressed(send: UIButton) {
        if (equalsPressed == true) {
            myLabel.text = ""
        }
        if (operand == ""){
            sum = (myLabel.text! as NSString).floatValue
            operand = send.titleLabel!.text!
            myLabel.text = ""
        }
        myLabel.text = ""
        equalsPressed = false
    }
    
    @IBAction func equalsPressed(send: UIButton) {
        oldOperatingAmount = (myLabel.text! as NSString).floatValue
        if operand == "+" {
            sum += (myLabel.text! as NSString).floatValue
        }
        else if operand == "-" {
            sum -= (myLabel.text! as NSString).floatValue
        }
        else if operand == "x" {
            sum = sum*(myLabel.text! as NSString).floatValue
        }
        else if operand == "/" {
            sum = sum/(myLabel.text! as NSString).floatValue
        }
        else if operand == "" {
            return;
        }
        myLabel.text = sum.description
        equalsPressed = true
        
    }
    
    //---------------------------life cycle methods-------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

