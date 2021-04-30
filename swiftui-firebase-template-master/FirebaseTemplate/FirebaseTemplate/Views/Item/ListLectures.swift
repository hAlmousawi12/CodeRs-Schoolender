//
//  ListLectures.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct ListLectures: View {
    var classs: Classes
    @EnvironmentObject var lectureEnv: LectureEnv
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            ScrollView {
                ForEach(lectureEnv.items, id: \.self) { lecture in
                    VStack {
                                    Text(lecture.name)
                                        .font(.title)
                                        .foregroundColor(Color(lecture.color))
                                    
                                    Text("Starts in: \(lecture.date)")
                                        .foregroundColor(Color("Green"))
                                    Text("Ends in: \(lecture.time)")
                                        .foregroundColor(Color("Green"))
                                    
                                
                        Divider()
                    }
                    .padding(.leading, 10)
                }
            }
        }.onAppear{ lectureEnv.loadItems(id: "\(classs.id)") }
    }
}

//struct ListLectures_Previews: PreviewProvider {
//    static var previews: some View {
//        ListLectures()
//    }
//}
