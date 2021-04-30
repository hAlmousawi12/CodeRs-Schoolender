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
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Sign Up")
                        .bold()
                        .foregroundColor(Color("Primary"))
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                VStack(spacing: 50) {
                    
                    VStack(alignment: .leading) {
                        Text("Name")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        
                        TextField("Name", text: $user.fullname)
                            .keyboardType(.default)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    VStack(alignment: .leading) {
                        Text("Email")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                    TextField("Email", text: $user.email)
                        .keyboardType(.emailAddress)
                        .frame(width: 320, height: 55)
                        .padding(10)
                        .background(Color("Primary"))
                        .cornerRadius(15)
                        .foregroundColor(Color("BG"))
                    }
                    VStack(alignment: .leading) {
                        Text("Password")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                    
                    SecureField("Password", text: $password)
                        .frame(width: 320, height: 55)
                        .padding(10)
                        .background(Color("Primary"))
                        .cornerRadius(15)
                        .foregroundColor(Color("BG"))
                    }
                    
                    VStack(spacing: 20) {
                        Button("Sign up"){
                            env.signUp(user: user, password: password)
                        }
                        .frame(width: 330, height: 65)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(15)
                        .foregroundColor(Color("BG"))
                        .font(.title2)
                        
                        NavigationLink(
                            destination: SignUp(),
                            label: {
                                HStack {
                                    Text("Already have an account ?")
                                    Text("Sign in")
                                        .bold()
                                }.foregroundColor(Color("Primary"))
                            })
                    }
                    

                }
            }
        }
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
