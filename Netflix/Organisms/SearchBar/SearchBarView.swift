//
//  SearchBarView.swift
//  Netflix
//
//  Created by Lourdes on 1/30/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchKey: String
    @Binding var isEditting: Bool
    @Binding var isLoading: Bool
    
    var body: some View {
        HStack() {
            ZStack(alignment: .leading) {
                Color.greySearchBackground
                    .cornerRadius(8)
                HStack {
                    
                    //Magnifying Glass Icon
                    if searchKey.isEmpty {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.greySearchText)
                            .padding(.leading, 10)
                    }
                    
                    //Search Text Field
                    TextField("Search", text: $searchKey)
                        .padding(7)
                        .padding(.leading, -3)
                        .background(Color.greySearchBackground)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .onTapGesture {
                            isEditting = true
                        }
                    
                    //Loading Indicator or X Button
                    if !searchKey.isEmpty {
                        Button(action: {
                            //OnClick X Mark
                            searchKey = ""
                        }, label: {
                            if isLoading {
                                ActivityIndicatorView(style: .medium,
                                                      animate: .constant(true))
                                    .configure { (indicator) in
                                        indicator.color = .white
                                    }
                                    .padding(.trailing, 10)
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.greySearchText)
                                    .padding(.trailing, 10)
                                    .frame(width: 35, height: 35)
                            }
                        })
                    }
                }
            }
            .frame(height: 36)
            .padding(.horizontal, 10)
            
            if !searchKey.isEmpty {
                Button(action: {
                    //OnClick CancelButton
                    searchKey = ""
                    isEditting = false
                    hideKeyboard()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.greySearchText)
                })
                .padding(.horizontal, 10)
            }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchKey: .constant(""), isEditting: .constant(false), isLoading: .constant(false))
    }
}
