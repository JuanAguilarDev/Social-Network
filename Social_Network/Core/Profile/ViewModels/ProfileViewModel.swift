//
//  ProfileViewModel.swift
//  Social_Network
//
//  Created by Juan Aguilar on 09/08/22.
//

import Foundation

class ProfileViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let user: User
    
    init(user: User){
        self.user = user
        self.fetchUserTweets()
    }
    
    // Traer los usuarios de la base datos y los muestra en un arreglo
    func fetchUserTweets(){
        guard let uid = user.id else {return}
        service.fetchTweets(forUid: uid){
            tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}
