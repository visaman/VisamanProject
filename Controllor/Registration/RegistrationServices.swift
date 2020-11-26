//
//  RegistrationServices.swift
//  VisaMan
//
//  Created by mac on 20/11/20.
//

import Foundation
import Alamofire
struct RegistrationService
{
    static let shared = RegistrationService()
    
    
    // MARK: - URL //userInterestApi
    private var countryBasedStatesUrl = Base_Url + ApiName.countryBasedStatesApi
    private var citiesOfStatesUrl = Base_Url + ApiName.citiesOfStatesApi
    private var userInterestUrl = Base_Url + ApiName.userInterestApi
    private var userRegistrationUrl = Base_Url + ApiName.userRegistrationApi
   
    // MARK: - Services
    func requestForGatAllStates(with dict: [String:String], completion: @escaping (StateModel?, Error?) -> ())
    {
       
        Alamofire.request(countryBasedStatesUrl, method: .post, parameters: dict, encoding: URLEncoding.default, headers:nil).responseJSON
        {  response in
              print(response)
            
           if let data = response.data
           {
              do
              {
                let userRespose = try JSONDecoder().decode(StateModel.self, from: data)
                completion(userRespose, nil)
              }catch let err
              {
                completion(nil, err)
              }
            }
    }
    
}

    
    func requestGetAllCities(with dict: [String:String], completion: @escaping (CityModel?, Error?) -> ())
    
    {
        Alamofire.request(citiesOfStatesUrl, method: .post, parameters: dict, encoding: URLEncoding.default, headers:nil).responseJSON
        {  response in
              print(response)
            
           if let data = response.data
           {
              do
              {
                let userRespose = try JSONDecoder().decode(CityModel.self, from: data)
                print(userRespose)
                completion(userRespose, nil)
              }
              catch let err
              {
                completion(nil, err)
              }
            }
    }
    }
    
    
    
    func requestGetUserInterest(completion: @escaping (UserInterestList?, Error?) -> ())
    
    {
        Alamofire.request(userInterestUrl, method: .get, encoding: URLEncoding.default, headers:nil).responseJSON
        {  response in
              print(response)
            
           if let data = response.data
           {
              do
              {
                let userRespose = try JSONDecoder().decode(UserInterestList.self, from: data)
                print(userRespose)
                completion(userRespose, nil)
              }
              catch let err
              {
                completion(nil, err)
              }
            }
    }
    }
    
    
    func requestRegisterApi(with dict: [String:String], completion: @escaping (Register?, Error?) -> ())
    
    {
        Alamofire.request(userRegistrationUrl, method: .post, parameters: dict, encoding: URLEncoding.default, headers:nil).responseJSON
        {  response in
              print(response)
            
           if let data = response.data
           {
              do
              {
                let userRespose = try JSONDecoder().decode(Register.self, from: data)
                print(userRespose)
                completion(userRespose, nil)
              }
              catch let err
              {
                completion(nil, err)
              }
            }
    }
    }

}
    
    

