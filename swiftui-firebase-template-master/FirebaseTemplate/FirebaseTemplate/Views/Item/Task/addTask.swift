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
    @State var taskDate = Date()
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
                        DatePicker("Date: ", selection: $taskDate, in: Date()...)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .cornerRadius(15)
                            .foregroundColor(Color("Primary"))
                    }
                    Button(action: { addTask() }, label: {
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
        }.alert(isPresented: $taskEnv.alertShown, content: {
            Alert(title: Text(taskEnv.alertMessage))
    })
    }
    func addTask() {
        let task = Task(name: taskName, date: taskDate.description)
        
        let content = UNMutableNotificationContent()
        content.title = "You have a task in less than a day"
        content.subtitle = "Don't be late"
        content.sound = UNNotificationSound.default
        let now = Date()
        var meow = 1.0
        meow = (taskDate.timeIntervalSince1970 - 86400) - now.timeIntervalSince1970
        if meow <= 0 {
            taskEnv.alertShown = true
            taskEnv.alertMessage = "The time you typed is wrong, try again!"
        } else {
            taskEnv.addItem(item: task, classId: classs.id, lectureId: lecture.id)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: meow, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
    }
}
