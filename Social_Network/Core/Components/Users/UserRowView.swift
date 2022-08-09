//
//  UserRowView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 02/08/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack(spacing:12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.fullname)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("@\(user.username)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }.padding(8)
    }
}


