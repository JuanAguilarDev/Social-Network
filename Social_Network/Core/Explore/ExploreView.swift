//
//  ExploreView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 11/07/22.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(0 ... 25, id: \.self){
                        _ in UserRowView()
                    }
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
