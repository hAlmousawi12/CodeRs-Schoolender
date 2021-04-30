//
//  TaskEnv.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class TaskEnv: ObservableObject{
    let collectionName = "users/\(Networking.getUserId() ?? "")/classes"
    @Published var items: [Task] = []
    @Published var alertShown = false
    @Published var alertMessage = ErrorMessages.none.message
    
    func loadItems(classId: UUID, lectureId: UUID){
        Networking.getListOf(COLLECTION_NAME: "\(collectionName)/\(classId)/lectures/\(lectureId)/tasks") { (items: [Task]) in
            self.items = items
        }
    }
    
    func addItem(item: Task, classId: UUID, lectureId: UUID){
        Networking.createItem(item, inCollection: "\(collectionName)/\(classId)/lectures/\(lectureId)/tasks") {
            self.showAlert(alertType: .success)
        } fail: { (error) in
            self.showAlert(alertType: .fail)
        }

    }
    
    enum ErrorMessages{
        case success, fail, none, incompleteForm
        var message: String {
            switch self {
            case .success: return "تم إضافة المهمة بنجاح"
            case .incompleteForm: return "قم بتعبئة جميع البيانات بشكل صحيح"
            case .fail: return "لم يتم إضافة المهمة، حاول مرة أخرى"
            case .none: return ""
            }
        }
    }
    
    func showAlert(alertType: ErrorMessages){
        self.alertMessage = alertType.message
        self.alertShown = true
    }

    
}
