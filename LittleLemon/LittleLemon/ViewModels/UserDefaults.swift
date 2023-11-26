//
//  UserDefaults.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 22/11/2023.
//

import SwiftUI

public let kFirstName = "first name key"
public let kLastName = "last name key"
public let kEmail = "e-mail key"
public let kIsLoggedIn = "kIsLoggedIn"
public let kPhoneNumber = "phone number key"

public let kOrderStatuses = "order statuses key"
public let kPasswordChanges = "password changes key"
public let kSpecialOffers = "special offers key"
public let kNewsletter = "news letter key"

class Model: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var orderStatuses: Bool = true
    @Published var passwordChanges: Bool = true
    @Published var specialOffers: Bool = true
    @Published var newsletter: Bool = true
    
    // Function to save data to UserDefaults
    private func saveToUserDefaults() {
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
    }

    // Function to fetch data from UserDefaults
    private func fetchFromUserDefaults() {
        firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
        lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
        email = UserDefaults.standard.string(forKey: kEmail) ?? ""
        phoneNumber = UserDefaults.standard.string(forKey: kPhoneNumber) ?? ""
        orderStatuses = UserDefaults.standard.bool(forKey: kOrderStatuses)
        passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
        specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
        newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
    }

    // Function to update data and save to UserDefaults
    func updateData(firstName: String, lastName: String, email: String, phoneNumber: String, orderStatuses: Bool, passwordChanges: Bool, specialOffers: Bool, newsletter: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.orderStatuses = orderStatuses
        self.passwordChanges = passwordChanges
        self.specialOffers = specialOffers
        self.newsletter = newsletter

        saveToUserDefaults()
    }

    // Function to fetch data on initialization
    init() {
        fetchFromUserDefaults()
    }
}

