//
//  calender.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct calendar: View {
    @EnvironmentObject var env: CalenderEnc
    @State var day1: [Calender] = []
    @State var day2: [Calender] = []
    @State var day3: [Calender] = []
    @State var day4: [Calender] = []
    @State var day5: [Calender] = []
    @State var day6: [Calender] = []
    @State var day7: [Calender] = []
    @State var otherDays: [Calender] = []
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 50) {
                    VStack {
                        HStack {
                            Text("30 April")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        if day1 == [] {
                            HStack {
                                Text("You have nothing in this day")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                        }
                        ForEach(day1, id: \.self) { cal in
                            
                            Day(day: "30 April", lecture: cal)
                        }
                    }
                    VStack {
                        HStack {
                            Text("May 1")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        if day2 == [] {
                            HStack {
                                Text("You have nothing in this day")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                        }
                        ForEach(day2, id: \.self) { cal in
                            
                            Day(day: "May 1", lecture: cal)
                        }
                    }
                    VStack {
                        HStack {
                            Text("May 2")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        if day3 == [] {
                            HStack {
                                Text("You have nothing in this day")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                        }
                        ForEach(day3, id: \.self) { cal in
                            Day(day: "May 2", lecture: cal)
                        }
                    }
                    VStack {
                        HStack {
                            Text("May 3")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        if day4 == [] {
                            HStack {
                                Text("You have nothing in this day")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                        }
                        ForEach(day4, id: \.self) { cal in
                            
                            
                            Day(day: "May 3", lecture: cal)
                        }
                    }
                    VStack {
                        HStack {
                            Text("May 4")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        if day5 == [] {
                            HStack {
                                Text("You have nothing in this day")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                        }
                        ForEach(day5, id: \.self) { cal in
                            
                            Day(day: "May 4", lecture: cal)
                        }
                    }
                    VStack {
                        HStack {
                            Text("May 5")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        if day6 == [] {
                            HStack {
                                Text("You have nothing in this day")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                        }
                        ForEach(day6, id: \.self) { cal in
                            
                            Day(day: "May 5", lecture: cal)
                        }
                    }
                    VStack {
                        HStack {
                            Text("May 6")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        if day7 == [] {
                            HStack {
                                Text("You have nothing in this day")
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                            }
                        }
                        ForEach(day7, id: \.self) { cal in
                            
                            Day(day: "May 6", lecture: cal)
                        }
                    }
                }
            }
        }.onAppear {
            env.loadItems()
            for item in env.items {
//                switch item.date {
//                case "April 30":
//                    if !day1.contains(item) {
//                        self.day1.append(item)
//                    }
//                case "May 1":
//                    if !day2.contains(item) {
//                        self.day2.append(item)
//                    }
//                case "May 2":
//                    if !day3.contains(item) {
//                        self.day3.append(item)
//                    }
//                case "May 3":
//                    if !day4.contains(item) {
//                        self.day4.append(item)
//                    }
//                case "May 4":
//                    if !day5.contains(item) {
//                        self.day5.append(item)
//                    }
//                case "May 5":
//                    if !day6.contains(item) {
//                        self.day6.append(item)
//                    }
//                case "May 6":
//                    if !day7.contains(item) {
//                        self.day7.append(item)
//                    }
//                default:
//                    self.otherDays.append(item)
//                    
//                }
            }
        }
    }
}

struct calendar_Previews: PreviewProvider {
    static var previews: some View {
        calendar()
    }
}

struct Day: View {
    var day : String
    var lecture: Calender
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Text("\(lecture.name)")
                    .foregroundColor(Color(lecture.color))
                    .font(.title2)
                Spacer()
            }.padding(.leading)
            Divider()
        }.padding(.leading, 5)
    }
}
