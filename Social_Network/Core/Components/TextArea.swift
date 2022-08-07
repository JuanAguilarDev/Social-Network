//
//  TextArea.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String // Conection between a properties that store data and show data
    let placeholder: String

    init(_ placeholder: String, text: Binding<String>){
        self._text = text
        self.placeholder = placeholder
        // Display text when the background = clear
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if(text.isEmpty){
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
    }
}

