//
//  User.swift
//  LittleLemon-iOS-app
//
//  Created by Jesús Enrique on 12/5/25.
//


import Foundation
import SwiftData

@Model
class User {
    var firstName: String
    var lastName: String
    var email: String

    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}

