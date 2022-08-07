//
//  SideMenuOptionRowView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    
var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
                
            Text(viewModel.title)
                .font(.subheadline).bold()
                .foregroundColor(.black)
                
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}



struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
