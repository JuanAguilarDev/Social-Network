//
//  LoginView.swift
//  Social_Network
//
//  Created by Juan Aguilar on 07/08/22.
//

import SwiftUI

struct LoginView: View {
    @State private var email = "" // Correo
    @State private var password = "" // Contrasenia
    @EnvironmentObject var viewModel: AuthViewModel //
    
    var body: some View {
        VStack{
            // Cabecera de las primeras vistas
            AuthenticationHeaderView(imageName: "hand.wave.fill", firstText: "Hello!", secondText: "Welcome Back")
            
            VStack(spacing: 40){ // Inputs del login
                CustomInputFile(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputFile(imageName: "lock", placeholderText: "Password", isSecuredFiel: true, text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            HStack{
                Spacer()
                NavigationLink{
                    Text("Reset password view...")
                }label:{
                    Text("Forgot password")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.vertical)
                        .padding(.trailing, 24)
                }
            }
            
            Button{ // Guarda los datos en la base de datos
                viewModel.login(withEmail: email, password: password)
            }label:{
                Text("Sign in")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .frame(width: 340, height: 50)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius:10, x: 0, y: 0)
            
            Spacer()
            
            HStack{ // Para registrarte
                NavigationLink{
                    RegistrationView()
                        .navigationBarHidden(true)
                }label: {
                    Text("Don't have an account?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Text("Sign up")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
