//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @State var user = User()
    @State var password = ""
    @EnvironmentObject var env: FirebaseEnv
    var body: some View {
        Form{
            TextField("first name", text: $user.firstName).keyboardType(.default)
            TextField("last name", text: $user.lastName).keyboardType(.default)
            TextField("email", text: $user.email).keyboardType(.emailAddress)
            SecureField("password", text: $password)
            Button("Sign up"){
                env.signUp(user: user, password: password)
            }
        }
        .navigationTitle("Sign up")
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUp()
                .environmentObject(FirebaseEnv())
        }
    }
}
