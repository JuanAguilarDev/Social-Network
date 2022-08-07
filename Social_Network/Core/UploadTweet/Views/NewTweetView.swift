//
//  NewTweetView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import SwiftUI

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Button{
                    mode.wrappedValue.dismiss()
                }label:{
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Button{
                    print("Dismiss. ")
                }label:{
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top){
                    Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening?", text: $caption)
                
                
            }
            .padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
