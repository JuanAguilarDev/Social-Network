//
//  UserService.swift
//  Social_Network
//
//  Created by Juan Aguilar on 08/08/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService{
    
    func fetchUsers(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument{ snapshot, _ in
                guard let snapshot = snapshot else {return}
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
                
            }
    }
    
    // Array of users
    func fetchAll(completion: @escaping([User]) -> Void){
        Firestore.firestore().collection("users")
            .getDocuments{
                snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let users = documents.compactMap({try? $0.data(as: User.self)}) // Map of each element
                completion(users)
            }
    }
}
