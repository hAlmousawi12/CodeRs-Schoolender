//
//  lecturesDetails.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct editLecture: View {
    var classs: Classes
    var lecture: Lecture
    @EnvironmentObject var lectureEnv: LectureEnv
    @State var lectureName: String = ""
    @State var lectureDate: String = ""
    @State var lectureTime = Date()
    @State var lectureColor: String = ""

    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Edit lecture")
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
                        Text("Date")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        TextField("lecture date", text: $lectureDate)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    VStack(alignment: .leading) {
                        DatePicker("Time: ", selection: $lectureTime, in: Date()..., displayedComponents: .hourAndMinute)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .cornerRadius(15)
                            .foregroundColor(Color("Primary"))

                    }
                    Button(action: {
                        
                        let editedLecture = Lecture(name: lectureName, time: lectureTime.timeIntervalSince1970, date: lectureDate, color: lectureColor, id: lecture.id)
                        lectureEnv.editLecture(item: editedLecture, classId: "\(classs.id)", lectureId: "\(lecture.id)")
                        
                    }, label: {
                        Text("Edit lecture")
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
}
