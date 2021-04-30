//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct SignIn: View {
    @State var userCredentials = SignInCredentials(email: "", password: "")
    @EnvironmentObject var env: FirebaseEnv
    @State var alertShown: Bool = false
    @State var alertError: String = ""
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Sign In")
                        .bold()
                        .foregroundColor(Color("Primary"))
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                Spacer()
                VStack(spacing: 50) {
                    VStack(alignment: .leading) {
                        Text("Email")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        
                        TextField("email", text: $userCredentials.email)
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
                        
                        SecureField("password", text: $userCredentials.password)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                        
                    }
                }
                Spacer()
                VStack(spacing: 20) {
                    Button("Sign in"){
                        env.signIn(user: userCredentials) { (uid) in
                            print("Signed in!")
                        } fail: { (error) in
                            alertError = error?.localizedDescription ?? ""
                            alertShown = true
                        }
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
                                Text("Don't have an account ?")
                                Text("Sign up")
                                    .bold()
                            }.foregroundColor(Color("Primary"))
                        })
                }
                Spacer()
            }
        }
        .alert(isPresented: $alertShown, content: {
            Alert(title: Text("Error!"), message: Text(alertError), dismissButton: .cancel())
        })
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
            .environmentObject(FirebaseEnv())
    }
}
