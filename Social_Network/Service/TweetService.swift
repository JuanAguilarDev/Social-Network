//
//  TweetService.swift
//  Social_Network
//
//  Created by Juan Aguilar on 09/08/22.
//

import Firebase
// Traer las publicaciones de la base datos
struct TweetService{
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = [
            "uid": uid,
            "caption": caption,
            "likes": 0,
            "timestamp": Timestamp(date: Date())] as [String: Any
        ]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data){
                error in
                if let error = error{
                    print("Error: \(error)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments{
            snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets)
            
        }
    }
    
    func fetchTweets(forUid uid: String,completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments{
            snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue()}))
            
        }
    }
}
