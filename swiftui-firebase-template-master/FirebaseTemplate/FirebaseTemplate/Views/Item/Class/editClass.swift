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
    @State var classStart: String = ""
    @State var classEnd: String = ""
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
                        Text("Starts")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        TextField("class start date", text: $classStart)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    VStack(alignment: .leading) {
                        Text("Ends")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        TextField("class end date", text: $classEnd)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    Button(action: {
                        let editedClass = Classes(name: className, start: classStart, ends: classEnd, color: classColor, id: classs.id)
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

//struct editClass_Previews: PreviewProvider {
//    static var previews: some View {
//        editClass()
//    }
//}
