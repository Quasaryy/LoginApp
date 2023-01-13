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
}

struct Person {
    var fName: String
    var lName: String
    var fullName: String {
        "\(fName) \(lName)"
    }
}

var usersArray: [Users] = [
    Users(login: "User", password: "password", person: Person(fName: "John", lName: "Smith")),
    Users(login: "User2", password: "password2", person: Person(fName: "Eva", lName: "Appleseed")),
    Users(login: "User3", password: "password3", person: Person(fName: "Anna", lName: "English"))]
