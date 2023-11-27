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
    
    @State private var orderStatuses = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
    @State private var isLoggedIn = false
    
    @State private var showSavedAlert = false
    
    @StateObject private var model = Model()
    
    var body: some View {
        VStack {
            NavigationLink(destination: Onboarding(), isActive: $isLoggedIn) { EmptyView() }
            
            Header()
            ScrollView(showsIndicators: false) {
                VStack() {
                    Text("Personal Information")
                        .sectionsTextStyle()
                    
                    AvatarSection()
                    TextFields(title: "First name", placeholder: "First Name", text: $firstName)
                    TextFields(title: "Last name", placeholder: "Last Name", text: $lastName)
                    TextFields(title: "Email", placeholder: "Email", text: $email)
                        .keyboardType(.emailAddress)
                    TextFields(title: "Phone number", placeholder: "Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                    EmailNotificationSection()
                    SaveDiscardButtons()
                    LogoutButton()
                }
                .padding(.horizontal)
            }
        }
        .textFieldStyle(.roundedBorder)
        .disableAutocorrection(true)
        .onAppear {
            loadUserData()
        }
        .alert(isPresented: $showSavedAlert) {
            Alert(
                title: Text("Changes Saved"),
                message: Text("Your changes have been saved."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    func loadUserData() {
        firstName = model.firstName
        lastName = model.lastName
        email = model.email
        phoneNumber = model.phoneNumber
        orderStatuses = model.orderStatuses
        passwordChanges = model.passwordChanges
        specialOffers = model.specialOffers
        newsletter = model.newsletter
    }
    
    func saveChanges() {
        model.updateData(firstName: firstName,
                         lastName: lastName,
                         email: email,
                         phoneNumber: phoneNumber,
                         orderStatuses: orderStatuses,
                         passwordChanges: passwordChanges,
                         specialOffers: specialOffers,
                         newsletter: newsletter)
        showSavedAlert = true
    }
    
    func AvatarSection() -> some View {
        VStack {
            Text("Avatar")
                .onboardingTextStyle()
                .padding(.leading)
            HStack {
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
    }
    
    func EmailNotificationSection() -> some View {
        VStack {
            Text("Email notifications")
                .sectionsTextStyle()
            
            Toggle("Order Statuses", isOn: $orderStatuses)
            Toggle("Password Changes", isOn: $passwordChanges)
            Toggle("Special Offers", isOn: $specialOffers)
            Toggle("Newsletter", isOn: $newsletter)
        }
        .padding(.trailing, 10)
        .foregroundColor(.primaryColor1)
        .tint(.primaryColor1)
    }
    
    func SaveDiscardButtons() -> some View {
        HStack {
            Button("Discard Changes") {
                loadUserData()
            }
            .buttonStyle(ButtonStylePrimaryColorReverse())
            
            Button("Save Changes") {
                saveChanges()
            }
            .buttonStyle(ButtonStylePrimaryColor1())
        }
        .padding(.vertical)
    }
    
    func LogoutButton() -> some View {
        Button("Logout") {
            model.updateData(firstName: "",
                             lastName: "",
                             email: "",
                             phoneNumber: "",
                             orderStatuses: false,
                             passwordChanges: false,
                             specialOffers: false,
                             newsletter: false)
            UserDefaults.standard.set(false, forKey: kIsLoggedIn)
            self.presentation.wrappedValue.dismiss()
        }
        .buttonStyle(ButtonStyleYellowColorWide())
    }
}

#Preview {
    Profile()
}
