//
//  VerifyMobileViewModel.swift
//  VisaMan
//
//  Created by mac on 06/11/20.
//

import UIKit
protocol sendOtpResponse:class
{
    func sendOtpApiResponse(response:VerifyMobileModel)
    func verifyOtpApiResponse(response:VerifyOtpModel)
}

class VerifyMobileViewModel: NSObject
{
   private var verifyMobileService: VerifyMobileService?
   weak var delegate : sendOtpResponse?
   var strMobileNumber = ""
   var strOtp = ""
    
   var strVerifiedCodeFirst = ""
   var strVerifiedCodeSecond = ""
   var strVerifiedCodeThird = ""
   var strVerifiedCodeFourth = ""
    
   var showAlertClosure: (() -> ())?
   var updateLoadingStatus: (() -> ())?
    
   //private var dataService: VerifyMobileService?
   var validationError: String?
   {
        didSet
        {
            self.showAlertClosure?()
        }
   }
    
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    
    
   //Mark -> Chech Validation
   func checkMobileNumberValidation()
   {
      print(strMobileNumber)
      if strMobileNumber.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
      {
        self.validationError = ValidationMessages.blankMobileNumberAlert
      }
      else if strMobileNumber.count < 10
      {
        self.validationError = ValidationMessages.tenDigitMobileNumberAlert
      }
      else
      {
        sendOtpApi()
      }
   }
    
    //Mark -> Chech OTP Validation
    func checkOTPValidation()
    {
        strOtp = strVerifiedCodeFirst + strVerifiedCodeSecond + strVerifiedCodeThird + strVerifiedCodeFourth
        if strOtp.count < 4
        {
            self.validationError = ValidationMessages.blamkOtpNumberAlert
        }
        else
        {
            verifyOtpApi()
        }
    }
//    // MARK: - Constructor
    init(verifyMobileService: VerifyMobileService) {
        self.verifyMobileService = verifyMobileService
    }
    
    
    func sendOtpApi()
    {
        let param = ["mobile":strMobileNumber]
        self.isLoading = true
        self.verifyMobileService?.requestSendOtp(with: param, completion: { (sendOtpModel, error) in
            
         
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                //            self.photo = photo
                return
            }
            self.isLoading = false
            if sendOtpModel?.status == "success"
            {
                self.delegate?.sendOtpApiResponse(response: sendOtpModel!)
               
            }
            else  if sendOtpModel?.status == "failed"
            {
                self.validationError = sendOtpModel?.message ?? ""
                
            }
        })
    }
    
    
    func verifyOtpApi()
    {
        let param = ["mobile":strMobileNumber,"receivedOTP":strOtp,"deviceId":"dasas233efdfdsa3dcc","deviceType":"2"]
        self.isLoading = true
        self.verifyMobileService?.requestVerifyOtp(with: param, completion: { (verifyOtpModel, error) in
            
         
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                return
            }
            self.isLoading = false
          
            if verifyOtpModel?.status == "success"
            {
                self.delegate?.verifyOtpApiResponse(response: verifyOtpModel!)
            }
            else  if verifyOtpModel?.status == "failed"
            {
                self.validationError = verifyOtpModel?.message ?? ""
                
            }
        })
    }
    
    
    
}
