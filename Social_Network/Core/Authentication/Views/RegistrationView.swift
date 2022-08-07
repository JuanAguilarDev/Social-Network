//
//  RegistrationView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 07/08/22.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    
    var body: some View {
        VStack{
            AuthenticationHeaderView(imageName: "checkmark.seal.fill", firstText: "Get Started!", secondText: "Create your account")
            
            VStack(spacing: 40){
                CustomInputFile(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputFile(imageName: "person.2", placeholderText: "Username", text: $password)
                
                CustomInputFile(imageName: "person", placeholderText: "Full name", text: $password)
                
                CustomInputFile(imageName: "lock", placeholderText: "Password", text: $password)
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            Button{
                print("Sign up")
            }label:{
                Text("Sign up")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius:10, x: 0, y: 0)
            .padding(.top, 30)
            
            Spacer()
            
            HStack{
                NavigationLink{
                    RegistrationView()
                        .navigationBarHidden(true)
                }label: {
                    Text("Already have an account?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Text("Sign in")
                        .font(.body)
                        .fontWeight(.bold)
                }
                .foregroundColor(.blue)
            }
            .padding(.vertical)
            
        }
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
