//
//  CountryViewModel.swift
//  VisaMan
//
//  Created by mac on 25/11/20.
//

import UIKit
protocol CountryResponse:class
{
    func popularApiResponse(response:PopularCountryModel)
    func viewAllApiResponse(response:ViewAllCountryList)
}
class CountryViewModel: NSObject
{
       weak var delegate : CountryResponse?
       private var countryListService: CountryListService?
       var strCountryId = ""
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
        
        var isLoading: Bool = false
        {
            didSet { self.updateLoadingStatus?() }
        }
    
    
    
   // MARK: - Constructor
    init(countryListService: CountryListService) {
        self.countryListService = countryListService
    }
   
    func getAllPopularCountryApi()
    {
       
        self.isLoading = true
       print(self.strCountryId)
       let param = ["loginUserCountryId":self.strCountryId]
       self.countryListService?.requestForPopularCountry(with: param, completion: { (PopularCountryModel, error) in
                
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                return
            }
            self.isLoading = false
            if PopularCountryModel?.status == "success"
            {
                self.delegate?.popularApiResponse(response:PopularCountryModel!)
               
            }
            else  if PopularCountryModel?.status == "failed"
            {
                self.validationError = PopularCountryModel?.message ?? ""
                
            }
        })
    }
    
    
    func getViewAllCountryApi()
    {
       
        self.isLoading = true
       
       let param = ["loginUserCountryId":self.strCountryId]
      
       self.countryListService?.requestForAllCountries(with: param, completion: { (ViewAllCountryList, error) in
                
            if let error = error
            {
                self.validationError = error.localizedDescription
                self.isLoading = false
                return
            }
            self.isLoading = false
            if ViewAllCountryList?.status == "success"
            {
                self.delegate?.viewAllApiResponse(response:ViewAllCountryList!)
               
            }
            else  if ViewAllCountryList?.status == "failed"
            {
                self.validationError = ViewAllCountryList?.message ?? ""
                
            }
        })
    }


}
