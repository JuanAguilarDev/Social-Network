//
//  ProfileView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 11/07/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            ZStack(alignment: .bottomLeading){
                Color(.systemBlue)
                    .ignoresSafeArea()// All the screen
                
                VStack{
                    // Return button
                    Button{
                        
                    }label: {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .foregroundColor(.white)
                            .offset(x: 16, y: 12)
                    }
                
                    // Profile image
                    Circle()
                        .frame(width: 72, height: 72)
                        .offset(x: 16, y: 24)
                }
                
                .frame(height: 96)
                
            }
            
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

