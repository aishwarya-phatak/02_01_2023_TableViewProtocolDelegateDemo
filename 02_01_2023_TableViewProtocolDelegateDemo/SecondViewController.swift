//
//  SecondViewController.swift
//  02_01_2023_TableViewProtocolDelegateDemo
//
//  Created by Vishal Jagtap on 01/02/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var firstName : String = ""
    var lastName : String = ""
    var city : String = ""
    var phoneNumber : Int = 0
    
    var studentInfoDelegate : StudentInformationPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func btnSubmitClick(_ sender: Any) {
        firstName = firstNameTextField.text!
        lastName = lastNameTextField.text!
        city = cityTextField.text!
        phoneNumber = (phoneNumberTextField.text?.codingKey.intValue)!
        
        guard let studentInfoDelegate = studentInfoDelegate else { return  }
        
        var studentObject = Student(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, city: city)
        studentInfoDelegate.passStudentData(student: studentObject)
        
        navigationController?.popViewController(animated: true)
    }
}
