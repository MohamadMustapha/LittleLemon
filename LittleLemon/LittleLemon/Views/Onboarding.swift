//
//  Onboarding.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 11/11/2023.
//

import SwiftUI


struct Onboarding: View {
    @StateObject private var model = Model()
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Image("Logo")
                Hero()
                    .background(Color.primaryColor1)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)

                VStack() {
                    HStack{
                        TextFields(title: "First name *",
                                   placeholder: "First Name",
                                   text: $firstName)
                        TextFields(title: "Last name *",
                                   placeholder: "Last Name",
                                   text: $lastName)
                    }
                    TextFields(title: "Email *", 
                               placeholder: "Email",
                               text: $email)
                        .keyboardType(.emailAddress)
                    TextFields(title: "Phone number *", 
                               placeholder: "Phone Number",
                               text: $phoneNumber)
                        .keyboardType(.phonePad)
                    
                    Button("Register") {
                        handleRegistration()
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
                }
                .padding()
            }
            .onAppear {
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
            }
            .disableAutocorrection(true)
        }
    }
    
    func handleRegistration() {
        guard isValidEmail(email) else {
            // Handle invalid email format
            return
        }
        
        model.updateData(firstName: firstName,
                         lastName: lastName,
                         email: email,
                         phoneNumber: phoneNumber,
                         orderStatuses: true,
                         passwordChanges: true,
                         specialOffers: true,
                         newsletter: true)
        
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        clearFields()
        isLoggedIn = true
        print("success")
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func clearFields() {
        firstName = ""
        lastName = ""
        email = ""
        phoneNumber = ""
    }
}

struct TextFields: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            Text(title)
                .onboardingTextStyle()
            TextField(placeholder, text: $text)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    Onboarding()
}
