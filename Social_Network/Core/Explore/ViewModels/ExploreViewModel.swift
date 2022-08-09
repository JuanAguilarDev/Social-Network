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
    
    // Te permite buscar usuarios mediante la barra de busqueda
    var searchableUsers: [User]{
        if searchText.isEmpty{
            return users
        }else{
            let lowerCased = searchText.lowercased()
            return users.filter({$0.username.lowercased().contains(lowerCased) || $0.fullname.lowercased().contains(lowerCased)})
        }
    }
    
    let service = UserService() // Inicializar usuarios
    
    init(){
        fetchUsers() // Actualizar usuarios
    }
    
    // Traer usuarios de la base de datos
    func fetchUsers(){
        service.fetchAll{
            users in self.users = users
            
            print("\(users)")
        }
    }
}
