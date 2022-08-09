//
//  NewTweetView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 06/08/22.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var uploadTweetModel: UploadTweetViewModel
    
    init() {
        self.uploadTweetModel = UploadTweetViewModel()
    }
    
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
                    uploadTweetModel.uploadTweet(withCaption: caption)
                    
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
                if let user = viewModel.currentUser{
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                
                    TextArea("What's happening?", text: $caption)
                }
            }
            .padding()
        }
        .onReceive(uploadTweetModel.$diduploadTweet){ // Close the upload view after send a post
            success in
            if success {
                mode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
