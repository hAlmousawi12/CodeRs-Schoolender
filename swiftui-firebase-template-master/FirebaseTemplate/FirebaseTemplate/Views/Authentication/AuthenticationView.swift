//
//  AuthenticationView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack {
                Text("Welcome!")
                    .font(.largeTitle)
                    .foregroundColor(Color("Primary"))
                    .padding(.top, 50)
                Spacer()
                VStack(spacing: 20) {
                    NavigationLink(
                        destination: SignIn(),
                        label: {Text("Sign in")}
                    )
                    .frame(width: 300, height: 75)
                    .background(Color("Primary"))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                    
                    NavigationLink(
                        destination: SignUp(),
                        label: {Text("Sign Up")}
                    )
                    .frame(width: 300, height: 75)
                    .background(Color("Green"))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                    
                }
            }.padding(.vertical, 20)
        }
    }
}

struct SignInModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity,  alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AuthenticationView()
            AuthenticationView()
                .colorScheme(.dark)
        }
    }
}
