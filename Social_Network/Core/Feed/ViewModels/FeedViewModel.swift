//
//  FeedViewModel.swift
//  Social_Network
//
//  Created by Juan Aguilar on 09/08/22.
//

import Foundation


class FeedViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets(){
        service.fetchTweets{
            tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                // get the user asociated with the post
                self.userService.fetchUsers(withUid: uid){ user in
                    self.tweets[i].user = user
                }
                
            }
        }
    }
    
}
