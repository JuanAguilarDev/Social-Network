//
//  ContentView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 10/07/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    // Load the side menu
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if(viewModel.userSession == nil){ // No user logged in
                LoginView() // Si no hay sesion, te manda al login
            }else{ // User logged in
                mainInterfaceView // Te manda a la pagina de main (los posts)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}


extension ContentView{
    var mainInterfaceView: some View{ // Muestra Publicaciones
        ZStack(alignment: .topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if(showMenu){
                ZStack{
                    Color(.black).opacity( showMenu ? 0.25 : 0)
                }.onTapGesture{
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                if let user = viewModel.currentUser{
                    Button{ // boton de perfil
                        withAnimation(.easeInOut){
                            showMenu.toggle()
                        } // Toggle the boolean value
                    } label:{ // Te muestra la foto
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                }
            }
        }
        // Hide the side menu
        .onAppear{
            showMenu = false
        }
    }
}
