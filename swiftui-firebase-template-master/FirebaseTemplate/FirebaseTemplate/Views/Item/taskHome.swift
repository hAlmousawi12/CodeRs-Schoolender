//
//  taskHome.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct taskHome: View {
    var classs: Classes
    var lecture: Lecture
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                NavigationLink("Add a new task", destination: addTask(classs: classs, lecture: lecture))
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                
                NavigationLink("My tasks", destination: listTask(classs: classs, lecture: lecture))
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                
                NavigationLink("Edit lecture", destination: editLecture(classs: classs, lecture: lecture))
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
            }
        }
    }
}

//struct taskHome_Previews: PreviewProvider {
//    static var previews: some View {
//        taskHome()
//    }
//}
