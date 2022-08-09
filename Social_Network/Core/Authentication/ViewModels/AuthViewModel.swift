//
//  AuthViewModel.swift
//  Social_Network
//
//  Created by Juan Aguilar on 07/08/22.
//

import SwiftUI
import Firebase
// Interactuar con la base datos
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser() // Muestra los usuarios
    }
    
    // Login (auth)
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            
            if let error = error {
                print("Failed to logIn, error: \(error.localizedDescription)")
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
            
        }
    }
    
    // Register user
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in
            if let error = error{
                print("Failed to register, error: \(error.localizedDescription)")
                return
            }
            
            // If this fail, exit to the function
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){
                    _ in
                    self.didAuthenticateUser = true
                    
                }
            
            print("User registered... ");
        }
    }
    
    // End user session
    func signOut(){
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileimage(_ image: UIImage){
        guard let uid = tempUserSession?.uid else {return}

        ImageUploader.uploadImage(image: image){
            profileImageUrl in Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]){
                    _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser(){
        // Current user == user fetched
        guard let uid = self.userSession?.uid else {return}
        service.fetchUsers(withUid: uid){
            user in self.currentUser = user
        }
    }
}
