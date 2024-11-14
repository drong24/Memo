//
//  MemoViewModel.swift
//  Memo
//
//  Created by Daisy Rong on 11/13/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class MemoViewModel : ObservableObject {
    
    @Published var memos = [MemoModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.memos.removeAll()
        do {
            db.collection("memos").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.memos.append(try document.data(as: MemoModel.self))
                        } catch {
                            print(error)
                        }
                    }
                    print(self.memos)
                }
            }
        }
    }
}
