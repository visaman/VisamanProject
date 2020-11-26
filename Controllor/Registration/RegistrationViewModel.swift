//
//  RegistrationViewModel.swift
//  VisaMan
//
//  Created by mac on 20/11/20.
//

import UIKit
protocol RegistrationResponse:class
{
    func stateApiResponse(response:StateModel)
    func cityApiResponse(response:CityModel)
    func userInterestApiResponse(response:UserInterestList)
    func registarationApiResponse(response:Register)
}
class RegistrationViewModel: NSObject
{
    weak var delegate : RegistrationResponse?
    var strName = ""
    var strEmailId = ""
    var strSelectYourCountry = ""
    var strSelectYourState = ""
    var strSelectYourCity = ""
    var strSelectInterest = ""
    var termsAndConditions : Bool = true
    var SecondTermsAndConditions : Bool = true
    var strCountryId = ""
    var strStateId = ""
    var strCityId = ""
    var strMobileNumber = ""
    var strTitle = ""
    private var registrationService: RegistrationService?
    
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
     
    var validationError: String?
    {
         didSet
         {
             self.showAlertClosure?()
         }
    }
     
     var isLoading: Bool = false
     {
         didSet { self.updateLoadingStatus?() }
     }
     
     //    // MARK: - Constructor
    // MARK: - Constructor
     init(registrationService: RegistrationService) {
         self.registrationService = registrationService
     }
    
    //Mark -> Check state validation
    func checkStateValidation()
    {
        if strSelectYourCountry.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankCountryAlert
        }
        else
        {
            self.getAllSatetsApi()
        }
    }
    
    func checkCityValidation()
    {
        if strSelectYourCountry.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankCountryAlert
        }
        else if strSelectYourState.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankStateAlert
        }
        else
        {
            self.getAllCityApi()
        }
    }
    
    func checkRegistrationValidation()
    {
        print(termsAndConditions)
        print(SecondTermsAndConditions)
        if strName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankUserNameAlert
        }
        else if strEmailId.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankEmailAlert
        }
        else if strSelectYourCountry.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankCountryAlert
        }
        else if strSelectYourState.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankStateAlert
        }
        else if strSelectYourCity.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
            self.validationError = ValidationMessages.blankCityAlert
        }
        else if strSelectInterest.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == ""
        {
          self.validationError = ValidationMessages.blankInterestAlert
        }
        else if !(self.validate(emailAddress: strEmailId))
        {
            self.validationError = ValidationMessages.validEmailIdAlert
        }
        else if termsAndConditions == false
        {
            self.validationError = ValidationMessages.selectTermsAmdConditionAlert
        }
        else if SecondTermsAndConditions == false
        {
            self.validationError = ValidationMessages.selectTermsAmdConditionAlert
        }
        else
        {
            userRegistrationApi()
        }
    }
    
    //Mark  -> Chech Email validation
    func validate(emailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", REGEX).evaluate(with: emailAddress)
    }
    
    
    func getAllSatetsApi()
    {
       
        self.isLoading = true
       
       let param = ["countryId":strCountryId]
       self.registrationService?.requestForGatAllStates(with: param, completion: { (StateModel, error) in
                
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                return
            }
        
            self.isLoading = false
            if StateModel?.status == "success"
            {
                self.delegate?.stateApiResponse(response:StateModel!)
               
            }
            else  if StateModel?.status == "failed"
            {
                self.validationError = StateModel?.message ?? ""
                
            }
        })
    }
    
    
    func getAllCityApi()
    {
       
        self.isLoading = true
       
       let param = ["stateId":self.strStateId]
       self.registrationService?.requestGetAllCities(with: param, completion: { (CityModel, error) in
                
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                return
            }
            self.isLoading = false
            if CityModel?.status == "success"
            {
                self.delegate?.cityApiResponse(response:CityModel!)
               
            }
            else  if CityModel?.status == "failed"
            {
                self.validationError = CityModel?.message ?? ""
                
            }
        })
    }
    
    
    func getUserInterestApi()
    {
       
        self.isLoading = true
       
      
       self.registrationService?.requestGetUserInterest(completion: { (Registration, error) in
                
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                return
            }
            self.isLoading = false
            if Registration?.status == "success"
            {
                self.delegate?.userInterestApiResponse(response: Registration!)
               
            }
            else  if Registration?.status == "failed"
            {
                self.validationError = Registration?.message ?? ""
                
            }
        })
    }

    
    func userRegistrationApi()
    {
       
        self.isLoading = true
//        userType:1
//        deviceType:1
//        deviceId:fasgafdsgadsfasfd
//        title:mr
//        fullName:Sudhanshu SIngh
//        emailId:ra@gmail.com
//        countryId:106
//        stateId:288
//        cityId:2065
//        interest:Business
//        mobileNumber:8898298982
       
        let param = ["userType":"1","deviceType":"2","deviceId":"jkdhj","title":self.strTitle,"fullName":self.strName,"emailId":strEmailId,"countryId":strCountryId,"stateId":strStateId,"cityId":strCityId,"interest":strSelectInterest,"mobileNumber":self.strMobileNumber]
        print(param)
       self.registrationService?.requestRegisterApi(with: param, completion: { (Register, error) in
                
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                return
            }
            self.isLoading = false
            if Register?.status == "success"
            {
                print(Register?.registeredUserData?[0].userId ?? -1)
                print(Register?.registeredUserData?[0].fullName ?? "")
                print(Register?.registeredUserData?[0].cityId ?? -1)
                print(Register?.registeredUserData?[0].countryId ?? -1)
                print(Register?.registeredUserData?[0].cityName ?? "")
                print(Register?.registeredUserData?[0].countryName ?? "")
                print(Register?.registeredUserData?[0].userType ?? "")
                print(Register?.registeredUserData?[0].title ?? "")
                print(Register?.registeredUserData?[0].userId ?? -1)
                print(Register?.registeredUserData?[0].interest ?? "")
                
                if Register?.registeredUserData?.count ?? 0 > 0
                {
                    UserDefaults.standard.set((Register?.registeredUserData?[0].userId ?? -1).description, forKey: "regUserId")
                   UserDefaults.standard.set(Register?.registeredUserData?[0].fullName ?? "", forKey: "regUserName")
                    UserDefaults.standard.set((Register?.registeredUserData?[0].cityId ?? -1).description, forKey: "regUserCityId")
                   UserDefaults.standard.set(Register?.registeredUserData?[0].cityName ?? "", forKey: "regUserCityName")
                   UserDefaults.standard.set(Register?.registeredUserData?[0].countryName ?? "", forKey: "regUserCountry")
                   UserDefaults.standard.set((Register?.registeredUserData?[0].countryId ?? -1).description, forKey: "regUserCountryId")
                    UserDefaults.standard.set((Register?.registeredUserData?[0].userType ?? -1).description, forKey: "regUserType")
                   UserDefaults.standard.set(Register?.registeredUserData?[0].title ?? "", forKey: "regUserTitle")
                   UserDefaults.standard.set((Register?.registeredUserData?[0].userId ?? -1).description, forKey: "regUserId")
                   UserDefaults.standard.set(Register?.registeredUserData?[0].interest ?? "", forKey: "regUserInterest")
                   UserDefaults.standard.set(Register?.registeredUserData?[0].emailId ?? "", forKey: "regUserEmail")
                    UserDefaults.standard.set(self.strMobileNumber, forKey: "regUserMobile")
                }
                   self.delegate?.registarationApiResponse(response:Register!)
                
               
            }
            else  if Register?.status == "failed"
            {
                self.validationError = Register?.message ?? ""
                
            }
        })
    }
}
