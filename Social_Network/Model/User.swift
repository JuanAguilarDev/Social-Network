//
//  User.swift
//  Social_Network
//
//  Created by Juan Aguilar on 08/08/22.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String 
}
