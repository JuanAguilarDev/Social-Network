//
//  ContentView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 10/07/22.
//

import SwiftUI

struct ContentView: View {
    // Load the side menu
    @State private var showMenu = false
    
    var body: some View {
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
                Button{
                    withAnimation(.easeInOut){
                        showMenu.toggle()
                    } // Toggle the boolean value
                } label:{
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        // Hide the side menu
        .onAppear{
            showMenu = false
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
