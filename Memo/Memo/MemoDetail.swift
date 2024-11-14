//
//  MemoDetail.swift
//  Memo
//
//  Created by Daisy Rong on 11/13/24.
//

import SwiftUI

struct MemoDetail: View {
    
    var memo : MemoModel
    
    var body: some View {
        VStack {
            Text(memo.title)
            Text(memo.content)
            
        }
    }
}

#Preview {
    MemoDetail(memo: MemoModel(title: "title", content: "content", timeDue: Date()))
}
