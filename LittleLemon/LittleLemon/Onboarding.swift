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

struct Onboarding: View {
    @State var FirstName: String
    @State var LastName: String
    @State var Email: String
     var body: some View {
        VStack{
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
                    
                    UserDefaults
                        .standard
                        .set(FirstName, forKey: firstName)
                    UserDefaults
                        .standard
                        .set(LastName, forKey: lastName)
                    UserDefaults
                        .standard
                        .set(Email, forKey: email)
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
         

    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}


#Preview {
    Onboarding(FirstName: "", LastName: "", Email: "")
}
