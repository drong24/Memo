//
//  MemoDetail.swift
//  Memo
//
//  Created by Daisy Rong on 11/13/24.
//

import SwiftUI

struct MemoDetail: View {
    
    @Binding var memo : MemoModel
    @StateObject var memoApp = MemoViewModel()
    
    var body: some View {
        VStack {
            TextField("Memo Title", text: $memo.title)
            TextEditor(text: $memo.content)
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing){
                Button("Save", action: {
                    memoApp.saveData(memo: memo)
                    memo.title = ""
                    memo.content = ""
                    memo.timeDue = Date()
                })
            }
        }
    }
}

#Preview {
    MemoDetail(memo: .constant(MemoModel(title: "title", content: "content", timeDue: Date())))
}
