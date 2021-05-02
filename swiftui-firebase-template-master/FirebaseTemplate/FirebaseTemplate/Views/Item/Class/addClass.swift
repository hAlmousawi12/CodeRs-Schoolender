//
//  AddItem.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct addClass: View {
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
                    Text("Add a new class")
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
                        
                        let addedClass = Classes(name: className, start: classStart.description, ends: classEnd.description, color: classColor, id: UUID())
                        classesEnv.addItem(item: addedClass)

                    }, label: {
                        Text("Add Class")
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


struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            addClass()
        }
    }
}
