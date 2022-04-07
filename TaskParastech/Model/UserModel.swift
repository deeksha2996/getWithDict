//
//  UserModel.swift
//  TaskParastech
//
//  Created by Deeksha Sharma on 07/04/22.
//

import Foundation

struct UserModel  : Codable {
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }

}
struct Results : Codable {
    let user : User?
    let seed : String?
    let version : String?

    enum CodingKeys: String, CodingKey {

        case user = "user"
        case seed = "seed"
        case version = "version"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decodeIfPresent(User.self, forKey: .user)
        seed = try values.decodeIfPresent(String.self, forKey: .seed)
        version = try values.decodeIfPresent(String.self, forKey: .version)
    }

}
struct User : Codable {
    let gender : String?
    let name : Name?
    let location : Location?
    let email : String?
    let username : String?
    let password : String?
    let salt : String?
    let md5 : String?
    let sha1 : String?
    let sha256 : String?
    let registered : String?
    let dob : String?
    let phone : String?
    let cell : String?
    let sSN : String?
    let picture : String?

    enum CodingKeys: String, CodingKey {

        case gender = "gender"
        case name = "name"
        case location = "location"
        case email = "email"
        case username = "username"
        case password = "password"
        case salt = "salt"
        case md5 = "md5"
        case sha1 = "sha1"
        case sha256 = "sha256"
        case registered = "registered"
        case dob = "dob"
        case phone = "phone"
        case cell = "cell"
        case sSN = "SSN"
        case picture = "picture"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        name = try values.decodeIfPresent(Name.self, forKey: .name)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        salt = try values.decodeIfPresent(String.self, forKey: .salt)
        md5 = try values.decodeIfPresent(String.self, forKey: .md5)
        sha1 = try values.decodeIfPresent(String.self, forKey: .sha1)
        sha256 = try values.decodeIfPresent(String.self, forKey: .sha256)
        registered = try values.decodeIfPresent(String.self, forKey: .registered)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        cell = try values.decodeIfPresent(String.self, forKey: .cell)
        sSN = try values.decodeIfPresent(String.self, forKey: .sSN)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
    }

}
struct Name : Codable {
    let title : String?
    let first : String?
    let last : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case first = "first"
        case last = "last"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        first = try values.decodeIfPresent(String.self, forKey: .first)
        last = try values.decodeIfPresent(String.self, forKey: .last)
    }

}
struct Location : Codable {
    let street : String?
    let city : String?
    let state : String?
    let zip : String?

    enum CodingKeys: String, CodingKey {

        case street = "street"
        case city = "city"
        case state = "state"
        case zip = "zip"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        street = try values.decodeIfPresent(String.self, forKey: .street)
        city = try values.decodeIfPresent(String.self, forKey: .city)
        state = try values.decodeIfPresent(String.self, forKey: .state)
        zip = try values.decodeIfPresent(String.self, forKey: .zip)
    }

}

