//
//  ExploreViewModel.swift
//  Social_Network
//
//  Created by Juan Aguilar on 09/08/22.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    @Published var searchText = ""
    
    
    var searchableUsers: [User]{
        if searchText.isEmpty{
            return users
        }else{
            let lowerCased = searchText.lowercased()
            return users.filter({$0.username.lowercased().contains(lowerCased) || $0.fullname.lowercased().contains(lowerCased)})
        }
    }
    
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchAll{
            users in self.users = users
            
            print("\(users)")
        }
    }
}
