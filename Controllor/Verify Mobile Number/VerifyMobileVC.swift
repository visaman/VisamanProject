//
//  VerifyMobileVC.swift
//  VisaMan
//
//  Created by mac on 04/11/20.
//

import UIKit
import SkyFloatingLabelTextField
import Toast_Swift
import DTGradientButton
import IHProgressHUD
import SwiftLoader
class VerifyMobileVC: UIViewController,UITextFieldDelegate,sendOtpResponse
{
    
    
   
    
    @IBOutlet weak var imgBackGround : UIImageView?
    @IBOutlet weak var viewHeader : UIView?
    @IBOutlet weak var viewOtpFirst : UIView?
    @IBOutlet weak var viewOtpSecond : UIView?
    @IBOutlet weak var viewOtpThird : UIView?
    @IBOutlet weak var viewOtpFourth : UIView?
    
    
    @IBOutlet weak var btnSubmit : UIButton?
    @IBOutlet weak var btnResendOtp : UIButton?
    @IBOutlet weak var txtMobileNumber : SkyFloatingLabelTextFieldWithIcon?
    @IBOutlet weak var txtFirstVerify : SkyFloatingLabelTextField?
    @IBOutlet weak var txtSecondVerify : SkyFloatingLabelTextField?
    @IBOutlet weak var txtThirdVerify : SkyFloatingLabelTextField?
    @IBOutlet weak var txtFourthVerify : SkyFloatingLabelTextField?
    
    
    @IBOutlet weak var viewContainer : UIView?
    @IBOutlet weak var viewHeight : NSLayoutConstraint?
    @IBOutlet weak var btnYConstraint : NSLayoutConstraint?
    @IBOutlet weak var viewHeightConstraint : NSLayoutConstraint?
    @IBOutlet weak var viewInner : UIView?
    
    @IBOutlet weak var lblShowTimerTime : UILabel?
    var totalTime = 30
    var count : Int = 0
    var countdownTimer: Timer?
    //dataService: DataService()
    var sendOtpModel = VerifyMobileViewModel(verifyMobileService: VerifyMobileService())
    override var prefersStatusBarHidden: Bool {
         return false
    }
    override func viewDidLoad() 
    {
        super.viewDidLoad()
//        let story = UIStoryboard(name: "Main", bundle:nil)
//        let vc = story.instantiateViewController(withIdentifier: "DashBoardTabBarViewController") as! UITabBarController
//        UIApplication.shared.windows.first?.rootViewController = vc
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
        self.txtMobileNumber?.text = "9990158536"
        self.txtFirstVerify?.text = "1"
        self.txtSecondVerify?.text = "2"
        self.txtThirdVerify?.text = "3"
        self.txtFourthVerify?.text = "4"
        
        
        sendOtpModel.delegate = self
        self.title = "Welcome to Verification"
        self.viewInner?.isHidden = true
        self.viewHeightConstraint?.constant = 0
        self.view.layoutIfNeeded()
        
        self.btnSubmit?.layer.cornerRadius = (self.btnSubmit?.frame.size.height)!/2
        self.btnSubmit?.clipsToBounds = true
        
        self.btnResendOtp?.layer.cornerRadius = (self.btnResendOtp?.frame.size.height)!/2
        self.btnResendOtp?.clipsToBounds = true
 
        self.viewOtpFirst?.dropShadow(color: UIColor.lightGray, opacity: 0.4, offSet:.zero, radius: 15, scale: false)
        self.viewOtpFirst?.backgroundColor = UIColor.white
        
        self.viewOtpSecond?.dropShadow(color: UIColor.lightGray, opacity: 0.4, offSet:.zero, radius: 15, scale: false)
        self.viewOtpSecond?.backgroundColor = UIColor.white
        
        self.viewOtpThird?.dropShadow(color: UIColor.lightGray, opacity: 0.4, offSet:.zero, radius: 15, scale: false)
        self.viewOtpThird?.backgroundColor = UIColor.white
        
        self.viewOtpFourth?.dropShadow(color: UIColor.lightGray, opacity: 0.4, offSet:.zero, radius: 15, scale: false)
        self.viewOtpFourth?.backgroundColor = UIColor.white
        
        
        self.txtFirstVerify?.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.txtSecondVerify?.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.txtThirdVerify?.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        self.txtFourthVerify?.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
       
       


        
        self.txtMobileNumber?.iconImage = UIImage(imageLiteralResourceName: "textfieldMobileIcon")
        self.txtMobileNumber?.iconType = .image
        
        self.btnSubmit?.setGradientBackgroundColors([UIColor(red: 239/255.0, green: 122/255.0, blue: 35/255.0, alpha: 1), UIColor(red: 239/255.0, green: 73/255.0, blue: 63/255.0, alpha: 1)], direction:.toRight,for:.normal)
        
        txtFirstVerify?.textContentType = .oneTimeCode
        self.txtMobileNumber?.delegate = self
        self.txtFirstVerify?.delegate = self
        self.txtSecondVerify?.delegate = self
        self.txtThirdVerify?.delegate = self
        self.txtFourthVerify?.delegate = self
        

        self.txtFirstVerify?.textAlignment = .center
        self.txtSecondVerify?.textAlignment = .center
        self.txtThirdVerify?.textAlignment = .center
        self.txtFourthVerify?.textAlignment = .center
        
        
        self.viewContainer?.isHidden = true
        self.viewHeight?.constant = 0
        self.btnYConstraint?.constant = 0
        self.view.layoutIfNeeded()
        
        sendOtpModel.showAlertClosure =
        {
            self.view.makeToast(self.sendOtpModel.validationError, duration: 1.0, position: .center)
        }
        
        sendOtpModel.updateLoadingStatus =
        {
            if self.sendOtpModel.isLoading == true
            {
                SwiftLoader.show(animated: true)
            }
            else
            {
                SwiftLoader.hide()
            }
        }
    }
    
    func sendOtpApiResponse(response: VerifyMobileModel)
    {
        if response.status ?? "" == "success"
        {
            self.viewContainer?.isHidden = false
            self.viewHeight?.constant = 46
            self.btnYConstraint?.constant = 80
            self.viewHeightConstraint?.constant = 224
            self.viewInner?.isHidden = false
            self.view.layoutIfNeeded()
            count = 1
            totalTime = 30
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        
    }
    func verifyOtpApiResponse(response: VerifyOtpModel)
    {
        if response.status ?? "" == "success"
        {
           
            if response.isExist == "userExist"
            {
                UserDefaults.standard.set((response.verificationData?[0].id ?? ""), forKey: "regUserId")
                UserDefaults.standard.set(response.verificationData?[0].full_name ?? "", forKey: "regUserName")
                UserDefaults.standard.set((response.verificationData?[0].city_id ?? ""), forKey: "regUserCityId")
                UserDefaults.standard.set((response.verificationData?[0].country_id ?? -1).description, forKey: "regUserCountryId")
                UserDefaults.standard.set((response.verificationData?[0].user_type ?? -1).description, forKey: "regUserType")
                UserDefaults.standard.set(response.verificationData?[0].title ?? "", forKey: "regUserTitle")
                UserDefaults.standard.set(response.verificationData?[0].interest ?? "", forKey: "regUserInterest")
                UserDefaults.standard.set(response.verificationData?[0].email_id ?? "", forKey: "regUserEmail")
                UserDefaults.standard.set(response.verificationData?[0].mobile_number ?? "", forKey: "regUserMobile")
                
                let story = UIStoryboard(name: "Main", bundle:nil)
                let vc = story.instantiateViewController(withIdentifier: "TabBarViewController") as! UITabBarController
                UIApplication.shared.windows.first?.rootViewController = vc
                UIApplication.shared.windows.first?.makeKeyAndVisible()
            }
            else if response.isExist == "userNotExist"
            {
                print(self.txtMobileNumber?.text ?? "")
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationVC
                vc.registerModel.strMobileNumber = self.txtMobileNumber?.text ?? ""
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
    
    
    //Mark -> set OTP textfield rang 1
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maxLength = 0
        if textField == self.txtMobileNumber
        {
            maxLength = 10
        }
        else
        {
            maxLength = 1
        }
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    @objc func textFieldDidChange(textField: UITextField)
    {
        let text = textField.text
        if  text?.count == 1
        {
            switch textField{
            case txtFirstVerify:
                txtSecondVerify?.becomeFirstResponder()
            case txtSecondVerify:
                txtThirdVerify?.becomeFirstResponder()
            case txtThirdVerify:
                txtFourthVerify?.becomeFirstResponder()
            
            default:
                break
            }
        }
        else if text?.count == 0
        {
            switch textField
            {
            case txtFirstVerify:
                 txtFirstVerify?.becomeFirstResponder()
            case txtSecondVerify:
                 txtFirstVerify?.becomeFirstResponder()
            case txtThirdVerify:
                 txtSecondVerify?.becomeFirstResponder()
            case txtFourthVerify:
                 txtThirdVerify?.becomeFirstResponder()
            
            default:
                break
            }
        }
    }
    
    
    //Mark -> Submit otp
    @IBAction func tapToSubmit(sender:UIButton)
    {
        if count == 0
        {
            sendOtpModel.strMobileNumber = self.txtMobileNumber?.text ?? ""
            sendOtpModel.checkMobileNumberValidation()
        }
        else
        {
            sendOtpModel.strVerifiedCodeFirst = self.txtFirstVerify?.text ?? ""
            sendOtpModel.strVerifiedCodeSecond = self.txtSecondVerify?.text ?? ""
            sendOtpModel.strVerifiedCodeThird = self.txtThirdVerify?.text ?? ""
            sendOtpModel.strVerifiedCodeFourth = self.txtFourthVerify?.text ?? ""
            sendOtpModel.checkOTPValidation()

        }

    }
    
    //Mark -> resend otp
    @IBAction func tapToResendOtp(sender:UIButton)
    {
        
        totalTime = 30
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        self.lblShowTimerTime?.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    func endTimer()
    {
        countdownTimer?.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d", seconds)
    }

}



