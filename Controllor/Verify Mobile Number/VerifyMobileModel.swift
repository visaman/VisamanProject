//
//  VerifyMobileModel.swift
//  VisaMan
//
//  Created by mac on 06/11/20.
//

import Foundation
import Alamofire
struct VerifyMobileModel : Codable
{
    let status : String?
    let message : String?
    let otpData : OtpData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case otpData = "OtpData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        otpData = try values.decodeIfPresent(OtpData.self, forKey: .otpData)
    }
}

        

       
struct OtpData : Codable {
    let mobile_number : String?
    let otp : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case mobile_number = "mobile_number"
        case otp = "otp"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mobile_number = try values.decodeIfPresent(String.self, forKey: .mobile_number)
        otp = try values.decodeIfPresent(String.self, forKey: .otp)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}


struct VerifyOtpModel : Codable
{
    let status : String?
    let message : String?
    let isExist : String?
    let verificationData : [VerificationData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case isExist = "isExist"
        case verificationData = "verificationData"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        isExist = try values.decodeIfPresent(String.self, forKey: .isExist)
        verificationData = try values.decodeIfPresent([VerificationData].self, forKey: .verificationData)
    }
}



struct VerificationData : Codable {
    let id : Int?
    let user_type : Int?
    let mobile_number : String?
    let device_type : Int?
    let device_id : String?
    let title : String?
    let full_name : String?
    let email_id : String?
    let password : String?
    let country_id : Int?
    let state_id : Int?
    let city_id : Int?
    let interest : String?
    let terms_condition : Int?
    let info_aggrement : Int?
    let status : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case user_type = "user_type"
        case mobile_number = "mobile_number"
        case device_type = "device_type"
        case device_id = "device_id"
        case title = "title"
        case full_name = "full_name"
        case email_id = "email_id"
        case password = "password"
        case country_id = "country_id"
        case state_id = "state_id"
        case city_id = "city_id"
        case interest = "interest"
        case terms_condition = "terms_condition"
        case info_aggrement = "info_aggrement"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        user_type = try values.decodeIfPresent(Int.self, forKey: .user_type)
        mobile_number = try values.decodeIfPresent(String.self, forKey: .mobile_number)
        device_type = try values.decodeIfPresent(Int.self, forKey: .device_type)
        device_id = try values.decodeIfPresent(String.self, forKey: .device_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
        email_id = try values.decodeIfPresent(String.self, forKey: .email_id)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        country_id = try values.decodeIfPresent(Int.self, forKey: .country_id)
        state_id = try values.decodeIfPresent(Int.self, forKey: .state_id)
        city_id = try values.decodeIfPresent(Int.self, forKey: .city_id)
        interest = try values.decodeIfPresent(String.self, forKey: .interest)
        terms_condition = try values.decodeIfPresent(Int.self, forKey: .terms_condition)
        info_aggrement = try values.decodeIfPresent(Int.self, forKey: .info_aggrement)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
