//
//  editClass.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct editClass: View {
    var classs: Classes
    @EnvironmentObject var classesEnv: ClassesEnv
    @State var className: String = ""
    @State var classStart = Date()
    @State var classEnd = Date()
    @State var classColor: String = ""
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Edit class")
                        .bold()
                        .foregroundColor(Color("Primary"))
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                }
                VStack(spacing: 20) {
                    
                    VStack(alignment: .leading) {
                        Text("Name")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        TextField("class name", text: $className)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Color")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        TextField("class color", text: $classColor)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    
                    VStack(alignment: .leading) {
                        DatePicker("Starts: : ", selection: $classStart, in: Date()...)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .cornerRadius(15)
                            .foregroundColor(Color("Primary"))
                    }
                    VStack(alignment: .leading) {
                        DatePicker("Ends: ", selection: $classEnd, in: Date()...)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .cornerRadius(15)
                            .foregroundColor(Color("Primary"))
                    }
                    Button(action: {
                        let editedClass = Classes(name: className, start: classStart.description, ends: classEnd.description, color: classColor, id: classs.id)
                        classesEnv.editClass(updatedClass: editedClass, id: classs.id)
                    }, label: {
                        Text("Edit Class")
                    })
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                    Spacer()
                }
                .padding()
                .alert(isPresented: $classesEnv.alertShown, content: {
                    Alert(title: Text(classesEnv.alertMessage))
            })
            }
        }
    }
}
