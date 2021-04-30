//
//  AddItem.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct AddItem: View {
    @EnvironmentObject var classesEnv: ClassesEnv
    @State var className: String = ""
    @State var classStart: String = ""
    @State var classEnd: String = ""
    @State var classColor: String = ""
    var body: some View {
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
                    
                    let addedClass = Classes(name: className, start: classStart, ends: classEnd, color: classColor)
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


struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddItem()
                .environmentObject(ItemsEnv())
        }
    }
}
