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
    
    func saveData(memo : MemoModel) {
        
        if let id = memo.id {
            if !memo.title.isEmpty || !memo.content.isEmpty {
                let docRef = db.collection("memos").document(id)
                
                docRef.updateData([
                    "title": memo.title,
                    "content": memo.content,
                    "timeDue": memo.timeDue
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Sucessfully updated document.")
                    }
                }
            }
        } else {
            if !memo.title.isEmpty || !memo.content.isEmpty {
                db.collection("memos").addDocument(data: [
                    "title": memo.title,
                    "content": memo.content,
                    "timeDue": memo.timeDue
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Sucessfully added document.")
                    }
                }
            }
        }
    }
}
