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
    @State var lectureDate: String = ""
    @State var lectureTime: String = ""
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
                        Text("Time")
                            .foregroundColor(Color("Primary"))
                            .padding(.leading, 10)
                        TextField("lecture time", text: $lectureTime)
                            .frame(width: 320, height: 55)
                            .padding(10)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                            .foregroundColor(Color("BG"))
                    }
                    Button(action: {
                        
                        let addedLecture = Lecture(name: lectureName, time: lectureTime, date: lectureDate, color: lectureColor, id: UUID())
                        let uid = "\(classs.id)"
                        lectureEnv.addItem(item: addedLecture, id: uid)

                    }, label: {
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
}

//struct CalssDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ClassDetails()
//    }
//}
