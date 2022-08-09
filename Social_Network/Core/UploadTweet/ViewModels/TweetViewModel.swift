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
    // Sube el mensaje
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption){
            success in
            if success {
                // Dismiss screen
                self.diduploadTweet = true // Cierra la ventana de publicar post
                
            }else{
                // Show error message
            }
        }
    }
}
