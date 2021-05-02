//
//  Home.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct SignOutButton: View{
    var env: FirebaseEnv
    var body: some View{
        Button("Signout") {
            env.signOut()
        }
        .foregroundColor(.red)
    }
}

struct Home: View {
    @EnvironmentObject var env: FirebaseEnv
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                NavigationLink("Add a new class", destination: addClass())
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                
                NavigationLink("My classes", destination: listClass())
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                
                
//                NavigationLink("Calendar", destination: ContentView())
//                    .frame(width: 330, height: 65)
//                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .cornerRadius(15)
//                    .foregroundColor(Color("BG"))
//                    .font(.title2)
            }
        }.navigationBarItems(trailing: SignOutButton(env: env))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(FirebaseEnv())
    }
}
