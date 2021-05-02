//
//  CalssDetails.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct addLecture: View {
    var classs: Classes
    @EnvironmentObject var lectureEnv: LectureEnv
    @State var lectureName: String = ""
    @State var lectureDate = Date()
    @State var lectureTime = Date()
    @State var lectureColor: String = ""
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Add a new lecture")
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
                        TextField("lecture name", text: $lectureName)
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
                        TextField("lecture color", text: $lectureColor)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    
                    VStack(alignment: .leading) {
                        DatePicker("Date: ", selection: $lectureDate, in: Date()..., displayedComponents: .date)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .cornerRadius(15)
                            .foregroundColor(Color("Primary"))
                    }
                    VStack(alignment: .leading) {
                        DatePicker("Time: ", selection: $lectureTime, in: Date()..., displayedComponents: .hourAndMinute)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .cornerRadius(15)
                            .foregroundColor(Color("Primary"))

                    }
                    Button(action: { addLecture() }, label: {
                        Text("Add lecture")
                    })
                    .frame(width: 330, height: 65)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Green")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .cornerRadius(15)
                    .foregroundColor(Color("BG"))
                    .font(.title2)
                    Spacer()
                }
                .padding()
                .alert(isPresented: $lectureEnv.alertShown, content: {
                    Alert(title: Text(lectureEnv.alertMessage))
            })
            }
        }
    }
    func addLecture() {
        let addedLecture = Lecture(name: lectureName, time: lectureTime.timeIntervalSince1970, date: "\(lectureDate.description)", color: lectureColor, id: UUID())
        let uid = "\(classs.id)"
        let content = UNMutableNotificationContent()
        content.title = "You have a lecture in 10 minutes"
        content.subtitle = "Don't be late"
        content.sound = UNNotificationSound.default
        let now = Date()
        var meow = 1.0
        meow = (lectureTime.timeIntervalSince1970 + (lectureDate.timeIntervalSince1970 - now.timeIntervalSince1970)  - 600) - now.timeIntervalSince1970

        if meow <= 0 {
            lectureEnv.alertShown = true
            lectureEnv.alertMessage = "The time you typed is wrong, try again!"
        } else {
            lectureEnv.addItem(item: addedLecture, id: uid)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: meow, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
    }
}
