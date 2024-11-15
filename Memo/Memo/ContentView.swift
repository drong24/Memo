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
    @State var refresher: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                ForEach($memoApp.memos) { $memo in
                    HStack {
                        NavigationLink {
                            MemoDetail(memo: $memo)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(memo.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.black)
                                Text("Due: \(memo.timeDue.formatted(.iso8601.year().month().day()))")
                                    .foregroundStyle(Color.black)
                                Text(memo.content)
                                    .font(.footnote)
                                    .foregroundStyle(Color.gray)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        Spacer()
                        Button {
                            memoApp.deleteData(memo: memo)
                            memoApp.fetchData()
                            refresher.toggle()
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .border(Color.black)
                Spacer()
                Section {
                    NavigationLink {
                        MemoDetail(memo: $memo)
                    } label: {
                        Text("New Note")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color.black)
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
            }
            .navigationTitle("Memos")
            .padding()
            .onAppear() {
                memoApp.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
