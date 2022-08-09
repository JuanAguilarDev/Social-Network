//
//  TweetRowView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 10/07/22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    let tweet: Tweet
    var body: some View {
        
        // Tweet Row
        VStack(alignment: .leading, spacing: 15){
            
            // Profile image, user info and tweet
            if let user = tweet.user{
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                    
                    // User info and tweet caption
                    VStack(alignment: .leading, spacing: 4){
                        HStack{
                            // User info
                            Text(user.fullname)
                                .font(.subheadline).bold()
                                
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        // Tweet caption
                        Text(tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    
                        // Action buttons
                    }
                }
            }
            // End of Profile image, user info and tweet
            
            // Action buttons
            HStack{
                Button{
                    //Actions
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //Actions
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //Actions
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //Actions
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
                .padding()
                .foregroundColor(.gray)
            // Divide the tweets
            Divider()
            
        }
        
        
    }
}

