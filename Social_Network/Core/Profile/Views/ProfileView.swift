
//  ProfileView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 11/07/22.
//

import SwiftUI


struct ProfileView: View {
    // State for the selected option into the menu
    @State private var selectedFilter: TweetFilter = .Tweets
    // Container of a porperty
    @Namespace var animation
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
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()// All the screen
            
            VStack{
                // Return button
                Button{
                    
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                HStack(alignment: .center){
                    // Profile image
                    Circle()
                        .frame(width: 72, height: 72)
                        .offset(x: 16, y: 24)
                        
                        
                }.frame(width: 96)
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
            
            Button{
                
            }label: {
                Text("Edit profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
        
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
                Text("Healt Ledger")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            
            Text("@Joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your favorite villian")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "location.fill")
                        .foregroundColor(.green)
                    
                    Text("Gotham, NY")
                }
                
                
                HStack{
                    Image(systemName: "link")
                        .foregroundColor(.green)
                    
                    Text("www.juandev.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24){
                HStack{
                    Text("1")
                        .bold()
                    Text("Following")
                        .foregroundColor(.gray)
                }
                
                
                HStack{
                    Text("1M")
                        .bold()
                    Text("Followers")
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
            .font(.caption)
            
        }
        .padding(.horizontal)
    }// End of user details
    
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(0 ... 9, id:\.self){_ in
                    TweetRowView()
                        .padding()
                }
            }
        }
    }// End of tweetsview
    
}

