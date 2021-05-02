//
//  CalenderEnv.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class CalenderEnc: ObservableObject {
    let collectionName = "users/\(Networking.getUserId() ?? "")/calender"
    @Published var items: [Calender] = []
    @Published var alertShown = false
    @Published var alertMessage = ErrorMessages.none.message
    
    func loadItems(){
        Networking.getListOf(COLLECTION_NAME: collectionName) { (items: [Calender]) in
            self.items = items
        }
    }
    
    func addItem(item: Calender){
        Networking.createItem(item, inCollection: collectionName) {
        }
    }
    
    
    enum ErrorMessages{
        case success, fail, none, incompleteForm
        var message: String{
            switch self{
            case .success: return "تم إضافة العنصر بنجاح"
            case .incompleteForm: return "قم بتعبئة جميع البيانات بشكل صحيح"
            case .fail: return "لم يتم إضافة العنصر، حاول مرة أخرى"
            case .none: return ""
            }
        }
    }
    
    func showAlert(alertType: ErrorMessages){
        self.alertMessage = alertType.message
        self.alertShown = true
    }
}
