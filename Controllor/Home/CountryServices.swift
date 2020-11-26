//
//  CountryServices.swift
//  VisaMan
//
//  Created by mac on 25/11/20.
//

import Foundation
import Alamofire
struct CountryListService
{
    static let shared = CountryListService()
    
    
    // MARK: - URL //userInterestApi
    private var popularCountryUrl = Base_Url + ApiName.popularCountryApi
    private var viewAllCountriesUrl = Base_Url + ApiName.viewAllCountriesApi
 
    // MARK: - Popular Country Services
    
    func requestForPopularCountry(with dict: [String:String], completion: @escaping (PopularCountryModel?, Error?) -> ())
    {
       
//        Alamofire.request(popularCountryUrl, method: .post, parameters: dict, encoding: URLEncoding.default, headers:nil).responseJSON
//        {  response in
//              print(response.response?.statusCode)
//
//            switch response.result
//            {
//            case .success:
//                if let data = response.data
//                {
//                   do
//                   {
//                     let userRespose = try JSONDecoder().decode(PopularCountryModel.self, from: data)
//                     completion(userRespose, nil)
//                   }catch let err
//                   {
//                     completion(nil, err)
//                   }
//                 }
//
//                break
//            case .failure(let error):
//
//                completion(nil, error)
//            }
//
//    }
        
        //let urls = Base_Url + ApiName.popularCountryApi
       
        //let param = ["loginUserCountryId":countryModel.strCountryId]
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
            // Put your code which should be executed with a delay here
      
        Alamofire.request(popularCountryUrl, method: .post, parameters: dict, encoding: URLEncoding.default, headers:nil).responseJSON
            { response in
                switch response.result
                {
                case .success:
                    print(response)
                    if let data = response.data
                    {
                        do
                        {
                           let userRespose = try JSONDecoder().decode(PopularCountryModel.self, from: data)
                            completion(userRespose, nil)
                        }
                        catch let err
                        {
                            completion(nil, err)
                        }
                     }
                   
                   
                    break
                case .failure(let error):
                    
                    print(error.localizedDescription)
                }
                
          }
        }
}

    // MARK: - View All Country Services
    func requestForAllCountries(with dict: [String:String], completion: @escaping (ViewAllCountryList?, Error?) -> ())
    
    {
        Alamofire.request(viewAllCountriesUrl, method: .post, parameters: dict, encoding: URLEncoding.default, headers:nil).responseJSON
        {  response in
              print(response)
           if let data = response.data
           {
              do
              {
                let userRespose = try JSONDecoder().decode(ViewAllCountryList.self, from: data)
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
