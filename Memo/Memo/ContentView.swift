//
//  ContentView.swift
//  Memo
//
//  Created by Daisy Rong on 11/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var memoApp = MemoViewModel()
    var body: some View {

        NavigationStack {
            List {
                ForEach(memoApp.memos) { memo in
                    NavigationLink {
                        MemoDetail(memo: memo)
                    } label: {
                        Text(memo.title)
                    }
                }
            }
            .onAppear() {
                memoApp.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
