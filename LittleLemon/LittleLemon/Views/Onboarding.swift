//
//  Onboarding.swift
//  LittleLemon
//
//  Created by mohamad mostapha on 11/11/2023.
//

import SwiftUI

let firstName = "Mohamad"
let lastName = "Mustapha"
let email = "mmeraabi2012@gmail.com"
let phoneNumber = "78835354"
let kisLoggedIn = "kisLoggedIn"

struct Onboarding: View {
    @State var FirstName: String
    @State var LastName: String
    @State var Email: String
    @State var PhoneNumber: String
    @State var isLoggedIn: Bool = false
     var body: some View {
         NavigationView(content: {
        VStack{
            NavigationLink(destination: Home(),isActive: $isLoggedIn) { EmptyView() }
            HStack{
                TextField("First Name", text: $FirstName)
                    .padding(10)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 5
                        )
                        .stroke(
                            Color.green,
                            lineWidth: 1)
                    )
                
                TextField("Last Name", text: $LastName)
                    .padding(10)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 5
                        )
                        .stroke(
                            Color.green,
                            lineWidth: 1)
                    )
            }
            .padding(.vertical)
            
            TextField("Email", text: $Email)
                .padding(10)
                .background(
                    RoundedRectangle(
                        cornerRadius: 5
                    )
                    .stroke(
                        Color.green,
                        lineWidth: 1)
                )
            Button(action: {
                if (!Email.isEmpty && !LastName.isEmpty && !FirstName.isEmpty && isValidEmail(Email)){
                    
                    UserDefaults.standard.set(FirstName, forKey: firstName)
                    UserDefaults.standard.set(LastName, forKey: lastName)
                    UserDefaults.standard.set(Email, forKey: email)
                    UserDefaults.standard.set(PhoneNumber, forKey: phoneNumber)
                    UserDefaults.standard.set(true, forKey: kisLoggedIn)
                    isLoggedIn = true
                    print("success")
                }
                else{
                    print("error")
                }
            })
            {
                Text("Register")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.green)
                    .cornerRadius(50)
                
            }
            .padding(.vertical)
 
            
        }.padding()
                 .onAppear {
                     if UserDefaults.standard.bool(forKey: kisLoggedIn) {
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
    Onboarding(FirstName: "", LastName: "", Email: "", PhoneNumber: "")
}
