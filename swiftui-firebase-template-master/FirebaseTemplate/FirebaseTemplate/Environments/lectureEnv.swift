//
//  lectureEnv.swift
//  FirebaseTemplate
//
//  Created by Hussain on 4/30/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class LectureEnv: ObservableObject{
    let collectionName = "users/\(Networking.getUserId() ?? "")/classes"
    @Published var items: [Lecture] = []
    @Published var alertShown = false
    @Published var alertMessage = ErrorMessages.none.message
    
    func loadItems(id: String){
        Networking.getListOf(COLLECTION_NAME: "\(collectionName)/\(id)/lectures") { (items: [Lecture]) in
            self.items = items
        }
    }
    
    func addItem(item: Lecture, id: String){
        let uid = "\(item.id)"
        Networking.createItem(item, inCollection: "\(collectionName)/\(id)/lectures", withDocumentId: uid) {
            self.showAlert(alertType: .success)
        } fail: { (error) in
            self.showAlert(alertType: .fail)
        }

    }
    
//    func editLecture(item: Lecture, classId: String, lectureId: String) {
//        Networking.createItem(item, inCollection: "\(collectionName)/\(classId)/lectures", withDocumentId: "\(item.id)") {
//            self.showAlert(alertType: .success)
//        } fail: { (error) in
//            self.showAlert(alertType: .fail)
//        }
//
//    }
    
    func editLecture(item: Lecture, classId: String, lectureId: String) {
        Networking.createItem(item, inCollection: "\(collectionName)/\(classId)/lectures", withDocumentId: "\(lectureId)") {
            self.showAlert(alertType: .success)
        } fail: { (error) in
            self.showAlert(alertType: .fail)
        }
    }
    
    
    enum ErrorMessages{
        case success, fail, none, incompleteForm
        var message: String {
            switch self {
            case .success: return "تم إضافة المادة بنجاح"
            case .incompleteForm: return "قم بتعبئة جميع البيانات بشكل صحيح"
            case .fail: return "لم يتم إضافة المادة، حاول مرة أخرى"
            case .none: return ""
            }
        }
    }
    
    func showAlert(alertType: ErrorMessages){
        self.alertMessage = alertType.message
        self.alertShown = true
    }

    
}
