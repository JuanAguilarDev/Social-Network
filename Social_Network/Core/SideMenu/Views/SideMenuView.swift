//
//  SideMenuView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var viewModelAuth: AuthViewModel
    
    var body: some View {
        if let user = viewModelAuth.currentUser{
            VStack(alignment:.leading, spacing: 32){
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
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
                            ProfileView(user: user)
                        }label:{
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                        .foregroundColor(.black)
                    }else if(viewModel == .logout){
                        Button{
                            viewModelAuth.signOut()
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
}


