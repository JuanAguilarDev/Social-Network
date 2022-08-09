//
//  CustomInputFile.swift
//  Social_Network
//
//  Created by Juan Aguilar on 07/08/22.
//

import SwiftUI

struct CustomInputFile: View {
    let imageName: String
    let placeholderText: String
    var isSecuredFiel: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecuredFiel ?? false{ // Default value
                    SecureField(placeholderText, text: $text)
                }else{
                    TextField(placeholderText, text: $text)
                }
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputFile_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputFile(imageName: "enveloper", placeholderText: "Email", isSecuredFiel: false, text: .constant(""))
    }
}
