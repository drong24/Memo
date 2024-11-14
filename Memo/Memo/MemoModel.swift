//
//  MemoModule.swift
//  Memo
//
//  Created by Daisy Rong on 11/13/24.
//

import Foundation
import FirebaseFirestore

struct MemoModel : Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var content: String
    var timeDue: Date
}
