//
//  TweetFilter.swift
//  Social_Network
//
//  Created by Juan Aguilar on 01/08/22.
//

import Foundation

//Mostrar texto
// CaseIterable allows to treat our elements like an array
enum TweetFilter : Int, CaseIterable{
    case Tweets
    case Replies
    case Likes
    
    var title: String{
        switch self{
        case .Tweets: return "Posts"
        case .Likes: return "Likes"
        case .Replies: return "Replies"
        }
    }
}
