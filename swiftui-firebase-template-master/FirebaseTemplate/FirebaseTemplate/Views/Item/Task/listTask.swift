//
//  listTask.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct listTask: View {
    var classs: Classes
    var lecture: Lecture
    @EnvironmentObject var taskEnv: TaskEnv
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            ScrollView {
                ForEach(taskEnv.items, id: \.self) { task in
                    VStack {
                        Text(task.name)
                            .font(.title)
                            .foregroundColor(Color("Primary"))
                        
                        Text("Date: \(task.date)")
                            .foregroundColor(Color("Green"))
                        Divider()
                    }
                    .padding(.leading, 10)
                }
            }
        }.onAppear {
            taskEnv.loadItems(classId: classs.id, lectureId: lecture.id)
        }
    }
}
