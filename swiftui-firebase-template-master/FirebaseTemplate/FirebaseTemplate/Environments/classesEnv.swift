//
//  classesEnv.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class ClassesEnv: ObservableObject{
    let collectionName = "users/\(Networking.getUserId() ?? "")/classes"
    @Published var items: [Classes] = []
    @Published var alertShown = false
    @Published var alertMessage = ErrorMessages.none.message
    
    func loadItems(){
        Networking.getListOf(COLLECTION_NAME: collectionName) { (items: [Classes]) in
            self.items = items
        }
    }
    
    func addItem(item: Classes){
        Networking.createItem(item, inCollection: collectionName) {
            self.showAlert(alertType: .success)
        } fail: { (error) in
            self.showAlert(alertType: .fail)
        }
    }
    
    
    enum ErrorMessages{
        case success, fail, none, incompleteForm
        var message: String {
            switch self {
            case .success: return "تم إضافة الفصل بنجاح"
            case .incompleteForm: return "قم بتعبئة جميع البيانات بشكل صحيح"
            case .fail: return "لم يتم إضافة الفصل، حاول مرة أخرى"
            case .none: return ""
            }
        }
    }
    
    func showAlert(alertType: ErrorMessages){
        self.alertMessage = alertType.message
        self.alertShown = true
    }

    
}
