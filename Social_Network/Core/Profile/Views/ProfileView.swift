
//  ProfileView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 11/07/22.
//

import SwiftUI
import Kingfisher


struct ProfileView: View {
    // State for the selected option into the menu
    @State private var selectedFilter: TweetFilter = .Tweets
    //
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var mode
    // Container of a property
    @Namespace var animation
    
    init(user: User){
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            headerView
                
            // Buttons
            actionButtons
            
            // User details
            userInfoDetails
            
            //Options Menu
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, username: "Juan", fullname: "Juan Aguilar", profileImageUrl: "", email: "Juan@dev"))
    }
}

extension ProfileView {
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()// All the screen
            
            VStack(alignment: .leading){
                // Return button
                
                    Button{
                        mode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .offset(x: 10, y: -10)
                    }.padding(.horizontal)
                HStack(alignment: .center){
                    
                    Spacer()
                    // Profile image
                    KFImage(URL(string: viewModel.user.profileImageUrl))
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFill()
                        .frame(width: 72, height: 72)
                        .offset(x: 0, y: 24)
                        
                    Spacer()
                        
                }.frame(width: 390)
            }
        }
        .frame(height: 96)
    }// End headerView
    
    var actionButtons: some View{
        HStack(spacing: 12){
            
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
                .offset(x: -48, y: 0)
            
            Spacer()
            
            Button{
                
            }label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.horizontal, 10)
        
    }// End of action buttons
    
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFilter.allCases, id: \.rawValue){
                item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if(selectedFilter == item){
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "filter", in: animation)
                        
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 2)
                    }
                }// Asign item to our state variable
                .onTapGesture{
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:0, y:16))
    }// End of tweetFilterBar
    
    var userInfoDetails: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack{
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Web front end developer. :D")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "location.fill")
                        .foregroundColor(.green)
                    
                    Text("Abasolo, Gto")
                }
                
                
                HStack{
                    Image(systemName: "link")
                        .foregroundColor(.green)
                    
                    Text("www.juandev.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.vertical)
                .font(.caption)
            
        }
        .padding(.horizontal)
    }// End of user details
    
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(viewModel.tweets){tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }// End of tweetsview
    
}

