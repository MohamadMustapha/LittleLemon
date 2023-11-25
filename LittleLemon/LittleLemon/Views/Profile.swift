//
//  Profile.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 11/11/2023.
//

import SwiftUI

struct Profile: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    
    @State private var orderStatuses = false
    @State private var passwordChanges = false
    @State private var specialOffers = false
    @State private var newsletter = false

    @StateObject private var model = Model()
    var body: some View {
        VStack{
            
            Image("Logo")
                            
            ScrollView(showsIndicators: false){
                
                Text("Personal Information")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)

                VStack{
                    
                    Text("Avatar")
                        .onboardingTextStyle()
                        .padding(.leading)
                    HStack{
                        
                        Image("profile-image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 75)
                        Button("Change") {}
                            .buttonStyle(ButtonStylePrimaryColor1())
                        Button("Remove") {}
                            .buttonStyle(ButtonStylePrimaryColorReverse())
                        
                    }
                }
                
                VStack{
                    
                    Text("First name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                    
                }
                .padding(.vertical)
                
                VStack{
                    
                    Text("Last name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                    
                }
                
                VStack{
                    
                    Text("Email")
                        .onboardingTextStyle()
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    
                }
                .padding(.vertical)

                VStack{
                    
                    Text("Phone number")
                        .onboardingTextStyle()
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                    
                }
                
                Text("Email notifications")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)

                VStack {
                    
                    Toggle("Order Statuses", isOn: $orderStatuses)
                    Toggle("Password Changes", isOn: $passwordChanges)
                    Toggle("Special Offers", isOn: $specialOffers)
                    Toggle("Newsletter", isOn: $newsletter)

                }
                .padding(.trailing, 10)
                .foregroundColor(.primaryColor1)
                .tint(.primaryColor1)

                HStack{
                    
                    Button("Discard Changes") {
                        firstName = model.firstName
                        lastName = model.lastName
                        email = model.email
                        phoneNumber = model.phoneNumber
                        
                        orderStatuses = model.orderStatuses
                        passwordChanges = model.passwordChanges
                        specialOffers = model.specialOffers
                        newsletter = model.newsletter
                    }
                        .buttonStyle(ButtonStylePrimaryColorReverse())
                    Button("Save Changes") {
                        
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        UserDefaults.standard.set(false, forKey: kOrderStatuses)
                        UserDefaults.standard.set(false, forKey: kPasswordChanges)
                        UserDefaults.standard.set(false, forKey: kSpecialOffers)
                        UserDefaults.standard.set(false, forKey: kNewsletter)
                        self.presentation.wrappedValue.dismiss()

                    }
                        .buttonStyle(ButtonStylePrimaryColor1())
                    
                }
                .padding(.vertical)
                
                Button("Logout"){
                    UserDefaults.standard.set("", forKey: kFirstName)
                    UserDefaults.standard.set("", forKey: kLastName)
                    UserDefaults.standard.set("", forKey: kEmail)
                    UserDefaults.standard.set("", forKey: kPhoneNumber)
                    UserDefaults.standard.set(false, forKey: kOrderStatuses)
                    UserDefaults.standard.set(false, forKey: kPasswordChanges)
                    UserDefaults.standard.set(false, forKey: kSpecialOffers)
                    UserDefaults.standard.set(false, forKey: kNewsletter)
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .onAppear {
                    firstName = model.firstName
                    lastName = model.lastName
                    email = model.email
                    phoneNumber = model.phoneNumber
                    
                    orderStatuses = model.orderStatuses
                    passwordChanges = model.passwordChanges
                    specialOffers = model.specialOffers
                    newsletter = model.newsletter
                }
    }
}

#Preview {
    Profile()
}
