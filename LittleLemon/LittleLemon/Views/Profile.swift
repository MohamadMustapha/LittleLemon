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
    var body: some View {
        VStack{
            Text("Personal Information")
            Image("profile-image")
            Text("First Name: \(fname ?? "empty")")
            Text("Last Name: \(lname ?? "empty")")
            Text("Email: \(emailValue ?? "empty")")
            Button("Logout"){
                UserDefaults.standard.set(false,forKey: kisLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    Profile()
}
