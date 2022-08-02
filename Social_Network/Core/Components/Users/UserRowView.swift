//
//  UserRowView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 02/08/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4){
                Text("Juan")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("@MAG1920")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }.padding(8)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
