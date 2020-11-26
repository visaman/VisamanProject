//
//  RegistrationModel.swift
//  VisaMan
//
//  Created by mac on 20/11/20.
//

import Foundation


struct StateModel : Codable {
    let status : String?
    let message : String?
    let statesList : [StatesList]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case statesList = "statesList"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        statesList = try values.decodeIfPresent([StatesList].self, forKey: .statesList)
    }

}
struct StatesList : Codable
{
    let state_id : Int?
    let state_name : String?
    let country_id : Int?

    enum CodingKeys: String, CodingKey {

        case state_id = "state_id"
        case state_name = "state_name"
        case country_id = "country_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        state_id = try values.decodeIfPresent(Int.self, forKey: .state_id)
        state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
    }

}


struct CityModel : Codable
{
    let status : String?
    let message : String?
    let citiesList : [CitiesList]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case citiesList = "citiesList"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        citiesList = try values.decodeIfPresent([CitiesList].self, forKey: .citiesList)
    }
}

struct CitiesList : Codable {
    let city_id : String?
    let city_name : String?
    let state_id : String?
    let country_id : Int?

    enum CodingKeys: String, CodingKey {

        case city_id = "city_id"
        case city_name = "city_name"
        case state_id = "state_id"
        case country_id = "country_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
        city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
        state_id = try values.decodeIfPresent(String.self, forKey: .state_id)
        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
    }

}


struct UserInterestList : Codable {
    let status : String?
    let message : String?
    let interestList : [InterestList]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case interestList = "interestList"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        interestList = try values.decodeIfPresent([InterestList].self, forKey: .interestList)
    }

}

struct InterestList : Codable {
    let id : Int?
    let interest_name : String?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case interest_name = "interest_name"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        interest_name = try values.decodeIfPresent(String.self, forKey: .interest_name)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct Register : Codable {
    let status : String?
    let message : String?
    let registeredUserData : [RegisteredUserData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case registeredUserData = "registeredUserData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        registeredUserData = try values.decodeIfPresent([RegisteredUserData].self, forKey: .registeredUserData)
    }

}

struct RegisteredUserData : Codable {
    let userId : Int?
    let userType : Int?
    let deviceType : Int?
    let deviceId : String?
    let title : String?
    let fullName : String?
    let emailId : String?
    let countryId : Int?
    let stateId : Int?
    let cityId : Int?
    let interest : String?
    let status : Int?
    let countryName : String?
    let stateName : String?
    let cityName : String?

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case userType = "userType"
        case deviceType = "deviceType"
        case deviceId = "deviceId"
        case title = "title"
        case fullName = "fullName"
        case emailId = "emailId"
        case countryId = "countryId"
        case stateId = "stateId"
        case cityId = "cityId"
        case interest = "interest"
        case status = "status"
        case countryName = "countryName"
        case stateName = "stateName"
        case cityName = "cityName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        userType = try values.decodeIfPresent(Int.self, forKey: .userType)
        deviceType = try values.decodeIfPresent(Int.self, forKey: .deviceType)
        deviceId = try values.decodeIfPresent(String.self, forKey: .deviceId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        emailId = try values.decodeIfPresent(String.self, forKey: .emailId)
        countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
        stateId = try values.decodeIfPresent(Int.self, forKey: .stateId)
        cityId = try values.decodeIfPresent(Int.self, forKey: .cityId)
        interest = try values.decodeIfPresent(String.self, forKey: .interest)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
        stateName = try values.decodeIfPresent(String.self, forKey: .stateName)
        cityName = try values.decodeIfPresent(String.self, forKey: .cityName)
    }

}



