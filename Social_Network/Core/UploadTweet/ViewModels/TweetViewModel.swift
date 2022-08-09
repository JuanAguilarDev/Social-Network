//
//  TweetViewModel.swift
//  Social_Network
//
//  Created by Juan Aguilar on 09/08/22.
//

import Foundation


class UploadTweetViewModel: ObservableObject{
    @Published var diduploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption){
            success in
            if success {
                // Dismiss screen
                self.diduploadTweet = true
                
            }else{
                // Show error message
            }
        }
    }
}
