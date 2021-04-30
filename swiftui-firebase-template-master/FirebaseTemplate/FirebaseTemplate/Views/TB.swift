//
//  TB.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct TB: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            calendar().tabItem {
                Image(systemName: "calendar")
                Text("calendar")
            }
        }
    }
}

struct TB_Previews: PreviewProvider {
    static var previews: some View {
        TB()
    }
}
