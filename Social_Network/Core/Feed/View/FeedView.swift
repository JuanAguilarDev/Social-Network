//
//  FeedView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 10/07/22.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweeView = false
    @ObservedObject var viewModel: FeedViewModel
    
    init(){
        self.viewModel = FeedViewModel()
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets){
                        tweet in TweetRowView(tweet: tweet)
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
