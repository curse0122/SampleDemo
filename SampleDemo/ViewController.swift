//
//  ViewController.swift
//  SampleDemo
//
//  Created by Nier Liu on 2020/3/2.
//  Copyright © 2020 Nier Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var columnTextField: UITextField!
    @IBOutlet weak var rowTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        columnTextField.resignFirstResponder()
        rowTextField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let outputVC: OutputVC = segue.destination as! OutputVC
        
        outputVC.column = Int(columnTextField.text!)
        outputVC.row = Int(rowTextField.text!)
    }
    
    @IBAction func click(_ sender: Any) {
        columnTextField.resignFirstResponder()
        rowTextField.resignFirstResponder()
    }

}

