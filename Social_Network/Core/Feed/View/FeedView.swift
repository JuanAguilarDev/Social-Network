//
//  FeedView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 10/07/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweeView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 20, id: \.self){
                        _ in TweetRowView()
                            .padding()
                    }
                }
            }
            
            Button{
                showNewTweeView.toggle()
            }label:{
                Image(systemName: "plus.message.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweeView){
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
