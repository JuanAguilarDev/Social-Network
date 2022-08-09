//
//  Social_NetworkApp.swift
//  Social_Network
//
//  Created by Juan Aguilar on 10/07/22.
//

import SwiftUI
import Firebase

@main
struct Social_NetworkApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
