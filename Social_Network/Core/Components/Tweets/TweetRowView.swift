//
//  TweetRowView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 10/07/22.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        
        // Tweet Row
        VStack(alignment: .leading, spacing: 15){
            
            // Profile image, user info and tweet
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // User info and tweet caption
                VStack(alignment: .leading, spacing: 4){
                    HStack{
                        // User info
                        Text("Bruce Wayne")
                            .font(.subheadline).bold()
                            
                        Text("@Batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2W")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    // Tweet caption
                    Text("I belive in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                
                    // Action buttons
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

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
