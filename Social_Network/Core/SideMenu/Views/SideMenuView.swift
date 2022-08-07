//
//  SideMenuView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 32){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Juan Aguilar")
                        .font(.headline)
                    
                    Text("@JuanDev1290")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                UserStatsView()
                    .padding(.vertical)
                    .font(.caption)
            }
            .padding(.leading)
            .padding(.top)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){
                viewModel in
                
                if(viewModel == .profile){
                    NavigationLink{
                        ProfileView()
                    }label:{
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                    .foregroundColor(.black)
                }else if(viewModel == .logout){
                    Button{
                        print("Handle logout here... ")
                    } label:{
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }else{
                    SideMenuOptionRowView(viewModel: viewModel)
                }
                
            }
            .padding(.vertical, 4)
            
            Spacer()
        }
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

