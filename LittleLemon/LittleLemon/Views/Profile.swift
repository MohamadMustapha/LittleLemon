//
//  Profile.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 11/11/2023.
//

import SwiftUI

struct Profile: View {
    
    let fname = UserDefaults.standard.string(forKey: firstName)
    let lname = UserDefaults.standard.string(forKey: lastName)
    let emailValue = UserDefaults.standard.string(forKey: email)
    
    @Environment(\.presentationMode) var presentation
    
    @State private var firstNameText = ""
    @State private var lastNameText = ""
    @State private var emailText = ""
    @State private var phoneNumberText = ""
    
    @State private var orderStatus = false
    @State private var passwordChanges = false
    @State private var  specialOffers = false
    @State private var newsletter = false


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
                    TextField("First Name", text: $firstNameText)
                    
                }
                .padding(.vertical)
                
                VStack{
                    
                    Text("Last name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastNameText)
                    
                }
                
                VStack{
                    
                    Text("Email")
                        .onboardingTextStyle()
                    TextField("Email", text: $emailText)
                        .keyboardType(.emailAddress)
                    
                }
                .padding(.vertical)

                VStack{
                    
                    Text("Phone number")
                        .onboardingTextStyle()
                    TextField("Phone Number", text: $phoneNumberText)
                        .keyboardType(.phonePad)
                    
                }
                
                Text("Email notifications")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity, alignment: .leading)

                VStack {
                    
                    Toggle("Order Statuses", isOn: $orderStatus)
                    Toggle("Password Changes", isOn: $passwordChanges)
                    Toggle("Special Offers", isOn: $specialOffers)
                    Toggle("Newsletter", isOn: $newsletter)

                }
                .padding(.trailing, 10)
                .foregroundColor(.primaryColor1)
                .tint(.primaryColor1)

                HStack{
                    
                    Button("Discard Changes") {}
                        .buttonStyle(ButtonStylePrimaryColorReverse())
                    Button("Save Changes") {}
                        .buttonStyle(ButtonStylePrimaryColor1())
                    
                }
                .padding(.vertical)
                
                Button("Logout"){
                    UserDefaults.standard.set(false,forKey: kisLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

#Preview {
    Profile()
}
