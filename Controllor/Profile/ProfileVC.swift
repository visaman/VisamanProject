//
//  ProfileVC.swift
//  VisaMan
//
//  Created by mac on 09/11/20.
//

import UIKit
import SkyFloatingLabelTextField
class ProfileVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtPhoneNumber : SkyFloatingLabelTextField?
    @IBOutlet weak var txtEmailId : SkyFloatingLabelTextField?
    @IBOutlet weak var txtCountry : SkyFloatingLabelTextField?
    @IBOutlet weak var txtCity : SkyFloatingLabelTextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.txtPhoneNumber?.delegate = self
        self.txtEmailId?.delegate = self
        self.txtCountry?.delegate = self
        self.txtCity?.delegate = self
        
        self.txtPhoneNumber?.text = "9990158536"
        self.txtEmailId?.text = "ravikanttyagi@gmail.com"
        self.txtCountry?.text = "India"
        self.txtCity?.text = "Faridabad"
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if (textField==txtPhoneNumber)
        {
            textField.resignFirstResponder();
            txtEmailId?.becomeFirstResponder()
        }
        else if (textField==txtEmailId)
        {
            textField.resignFirstResponder();
            txtCountry?.becomeFirstResponder()
        }
        else if (textField==txtCountry)
        {
            textField.resignFirstResponder();
            txtCity?.becomeFirstResponder()
        }
        else if (textField==txtCity)
        {
            textField.resignFirstResponder();
            txtCity?.resignFirstResponder()
        }
        return true
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.title = "Profile"
    }

}
