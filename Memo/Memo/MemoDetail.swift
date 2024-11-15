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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    var body: some View {
        VStack {
            TextField("Memo Title", text: $memo.title)
            DatePicker(
                "Due Date:",
                selection: $memo.timeDue
            )
            TextEditor(text: $memo.content)
            
        }
        .padding(30)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing){
                Button("Save", action: {
                    memoApp.saveData(memo: memo)
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}

#Preview {
    MemoDetail(memo: .constant(MemoModel(title: "title", content: "content", timeDue: Date())))
}
