//
//  AuthenticationHeader.swift
//  Social_Network
//
//  Created by Juan Aguilar on 07/08/22.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    let imageName: String
    let firstText: String
    let secondText: String
    
    var body: some View {
        VStack(alignment:.leading){ // Header view
            HStack{Spacer()}
            HStack{
                Text(firstText)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Image(systemName: imageName)
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
            Text(secondText)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomLeft, .bottomRight]))
    }
}

