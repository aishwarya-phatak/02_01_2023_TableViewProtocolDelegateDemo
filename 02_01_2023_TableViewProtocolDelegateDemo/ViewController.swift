//
//  ViewController.swift
//  02_01_2023_TableViewProtocolDelegateDemo
//
//  Created by Vishal Jagtap on 01/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var studentTableView: UITableView!
    
    var secondViewController : SecondViewController = SecondViewController()
    var studentTableViewCell : StudentTableViewCell = StudentTableViewCell()
    var eachStudent : Student?
    var students : [Student] = [Student]()
    //way 2 //var students : [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        
        //MARK : Register XIB with studentTableView
        let uiNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentTableView.register(uiNib, forCellReuseIdentifier: "StudentTableViewCell")
    }


    @IBAction func btnAddStudentRecordClicked(_ sender: Any) {
        
        secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController)!
        secondViewController.studentInfoDelegate = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
        
        eachStudent = students[indexPath.row]
        
        studentTableViewCell.studentFirstNameLabel.text = eachStudent?.firstName
        studentTableViewCell.studentLastNameLabel.text = eachStudent?.lastName
        studentTableViewCell.studentCityLabel.text = eachStudent?.city
        studentTableViewCell.studentPhoneNumberLabel.text = "\(eachStudent?.phoneNumber)"
        
        return studentTableViewCell ?? UITableViewCell()
    }
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117.0
    }
    
}

extension ViewController : StudentInformationPassingProtocol{
    func passStudentData(student: Student) {
        eachStudent = Student(firstName: student.firstName, lastName: student.lastName, phoneNumber: student.phoneNumber, city: student.city)
        students.append(eachStudent!)
        studentTableView.reloadData()
    }
}
