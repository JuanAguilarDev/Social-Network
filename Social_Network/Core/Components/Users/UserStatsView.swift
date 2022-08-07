//
//  UserStatsView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("1")
                    .bold()
                Text("Following")
                    .foregroundColor(.gray)
            }
            
            
            HStack{
                Text("1M")
                    .bold()
                Text("Followers")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
