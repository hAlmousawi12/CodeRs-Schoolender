//
//  calender.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct calendar: View {
    var days = ["1 May Tomorrow", "2 May Sunday", "3 May Monday", "4 May Tuesday", "5 May Wednesday", "6 May Thursday"]
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 50) {
                    VStack(spacing: 10) {
                        HStack {
                            Text("30 April  Today")
                                .font(.title)
                                .foregroundColor(Color("Primary"))
                                .bold()
                            Spacer()
                        }
                        HStack {
                            Text("Hussain 06:00pm")
                                .foregroundColor(Color("Green"))
                                .font(.title2)
                            Spacer()
                        }.padding(.leading)
                        HStack {
                            Text("Homework")
                                .foregroundColor(Color("Green"))
                                .font(.title2)
                            Spacer()
                        }.padding(.leading)
                        Divider()
                    }.padding(.leading, 5)
                    
                    ForEach(days, id: \.self) { day in
                        VStack(spacing: 10) {
                            HStack {
                                Text(day)
                                    .font(.title2)
                                    .foregroundColor(Color("Green"))
                                Spacer()
                            }
                            HStack {
                                Text("You have nothing")
                                    .font(.title3)
                                    .foregroundColor(Color("Green"))
                                Spacer()
                            }.padding(.leading)
                            Divider()
                        }.padding(.leading, 5)
                    }
                }
            }
        }
    }
}

struct calendar_Previews: PreviewProvider {
    static var previews: some View {
        calendar()
    }
}
