//
//  ListItems.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct ListItems: View {
    @EnvironmentObject var classesEnv: ClassesEnv
    
    var body: some View {
        ZStack {
            Color("BG").edgesIgnoringSafeArea(.all)
            ScrollView {
                ForEach(classesEnv.items, id: \.self) { clas in
                    VStack {
                        Text(clas.name)
                            .font(.title)
                            .foregroundColor(Color(clas.color))
                        
                        Text("Starts in: \(clas.start)")
                            .foregroundColor(Color("Green"))
                        Text("Ends in: \(clas.ends)")
                            .foregroundColor(Color("Green"))
                        Divider()
                    }
                    .padding(.leading, 10)
                }
            }
        }.onAppear(perform: classesEnv.loadItems)
    }
}

struct ListItems_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListItems()
                .environmentObject(ItemsEnv())
        }
    }
}
