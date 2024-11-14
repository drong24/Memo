//
//  ContentView.swift
//  Memo
//
//  Created by Daisy Rong on 11/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var memoApp = MemoViewModel()
    @State var memo = MemoModel(title: "", content: "", timeDue: Date())
    
    var body: some View {

        NavigationStack {
            List {
                ForEach($memoApp.memos) { $memo in
                    NavigationLink {
                        MemoDetail(memo: $memo)
                    } label: {
                        Text(memo.title)
                    }
                }
                Section {
                    NavigationLink {
                        MemoDetail(memo: $memo)
                    } label: {
                        Text("New Note")
                    }
                }
            }
            .onAppear() {
                memoApp.fetchData()
            }
            .refreshable {
                memoApp.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
