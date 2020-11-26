//
//  CountryModel.swift
//  VisaMan
//
//  Created by mac on 25/11/20.
//

import Foundation
//#############Mark -> View All Popular Country List ###########
struct PopularCountryModel : Codable {
    let status : String?
    let message : String?
    let totalCountry : TotalCountry?
    let popularCountryList : [PopularCountryList]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case totalCountry = "totalCountry"
        case popularCountryList = "popularCountryList"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        totalCountry = try values.decodeIfPresent(TotalCountry.self, forKey: .totalCountry)
        popularCountryList = try values.decodeIfPresent([PopularCountryList].self, forKey: .popularCountryList)
    }

}

struct PopularCountryList : Codable {
    let countryId : Int?
    let countryName : String?
    let countryCode : String?
    let countryFlag : String?

    enum CodingKeys: String, CodingKey {

        case countryId = "countryId"
        case countryName = "countryName"
        case countryCode = "countryCode"
        case countryFlag = "countryFlag"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
        countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        countryFlag = try values.decodeIfPresent(String.self, forKey: .countryFlag)
    }

}

struct TotalCountry : Codable {
    let totalCountry : Int?

    enum CodingKeys: String, CodingKey {

        case totalCountry = "totalCountry"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        totalCountry = try values.decodeIfPresent(Int.self, forKey: .totalCountry)
    }

}
//#############Mark -> View All Popular Country List ###########


//#############Mark -> View All Country List ###########
struct ViewAllCountryList : Codable {
    let status : String?
    let message : String?
    let allCountryList : [AllCountryList]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case allCountryList = "allCountryList"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        allCountryList = try values.decodeIfPresent([AllCountryList].self, forKey: .allCountryList)
    }

}


struct AllCountryList : Codable {
    let countryId : Int?
    let countryName : String?
    let countryCode : String?
    let countryFlag : String?

    enum CodingKeys: String, CodingKey {

        case countryId = "countryId"
        case countryName = "countryName"
        case countryCode = "countryCode"
        case countryFlag = "countryFlag"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countryId = try values.decodeIfPresent(Int.self, forKey: .countryId)
        countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        countryFlag = try values.decodeIfPresent(String.self, forKey: .countryFlag)
    }

}
//#############Mark -> View All Country List ###########
