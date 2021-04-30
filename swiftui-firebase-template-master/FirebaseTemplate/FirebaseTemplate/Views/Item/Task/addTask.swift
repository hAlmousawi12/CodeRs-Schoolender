//
//  addTask.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct addTask: View {
    var classs: Classes
    var lecture: Lecture
    @State var taskName: String = ""
    @State var taskDate: String = ""
    @EnvironmentObject var taskEnv: TaskEnv
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Add a new task")
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
                        TextField("task name", text: $taskName)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Date")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        TextField("task date", text: $taskDate)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    Button(action: {
                            let task = Task(name: taskName, date: taskDate)
                        taskEnv.addItem(item: task, classId: classs.id, lectureId: lecture.id)

                    }, label: {
                        Text("Add Task")
                    })
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                    Spacer()
                }
                .padding()
                .alert(isPresented: $taskEnv.alertShown, content: {
                    Alert(title: Text(taskEnv.alertMessage))
            })
            }
        }
    }
}
