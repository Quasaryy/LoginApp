//
//  Users.swift
//  LoginApp
//
//  Created by Yury on 13.01.23.
//

struct Users {
    var login: String
    var password: String
    var person: Person
    static func getLoginAndPassword() -> Users {
        Users(login: "User", password: "password", person: Person(fName: "John", lName: "Appleseed"))
    }
}

struct Person {
    var fName: String
    var lName: String
    var fullName: String {
        "\(fName) \(lName)"
    }
}
