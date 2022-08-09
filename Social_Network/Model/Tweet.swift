//
//  Tweet.swift
//  Social_Network
//
//  Created by Juan Aguilar on 09/08/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User? // User who upload the post
}
