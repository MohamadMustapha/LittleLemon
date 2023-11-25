//
//  Onboarding.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 11/11/2023.
//

import SwiftUI


struct Onboarding: View {
    @StateObject private var model = Model()
    
    @State var firstName: String
    @State var lastName: String
    @State var email: String
    @State var phoneNumber: String
    @State var isLoggedIn: Bool = false
     var body: some View {
         NavigationView(content: {
        VStack{
            NavigationLink(destination: Home(),isActive: $isLoggedIn) { EmptyView() }
            
            Image("Logo")
            Hero()
                .background(Color.primaryColor1)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            VStack {
                
                HStack {
                    VStack{
                        
                        Text("First name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                        
                    }
                    .padding(.vertical)
                    
                    
                    VStack{
                        
                        Text("Last name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                        
                    }
                }
                VStack{
                    
                    Text("Email *")
                        .onboardingTextStyle()
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    
                }
                
                VStack{
                    
                    Text("Phone number *")
                        .onboardingTextStyle()
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                    
                }
                .padding(.vertical)
                Button("Register",action: {
                    if (!email.isEmpty && !lastName.isEmpty && !firstName.isEmpty && isValidEmail(email)){
                        
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
                        UserDefaults.standard.set(true, forKey: kOrderStatuses)
                        UserDefaults.standard.set(true, forKey: kPasswordChanges)
                        UserDefaults.standard.set(true, forKey: kSpecialOffers)
                        UserDefaults.standard.set(true, forKey: kNewsletter)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                        print("success")
                    }
                })
                .buttonStyle(ButtonStyleYellowColorWide())
            }
            .padding()
        }
        .onAppear {
            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                isLoggedIn = true
            }
        }
         })
         
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}


#Preview {
    Onboarding(firstName: "", lastName: "", email: "", phoneNumber: "")
}
