//
//  RegistrationView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-15.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel ()
    
    //same expression
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("Circle5")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height:150)
                .padding()
            //Email and password
            VStack{
                TextField("Enter your Email", text:$viewModel.email)
                    .autocapitalization(.none)
                    .modifier(Circle5TextFieldModifier())
                
                SecureField("Enter your password", text:$viewModel.password)
                
                    .modifier(Circle5TextFieldModifier())
                
                TextField("Enter your Full name", text: $viewModel.fulname)
                    .modifier(Circle5TextFieldModifier())
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(Circle5TextFieldModifier())
                
                
            }
            Button{
                Task{
                    try await viewModel.createUser()
                }
              
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width:352,height: 44 )
                    .background(.black)
                    .cornerRadius(8)
            }.padding(.vertical)
            Spacer()
            Divider()
            Button{
                dismiss()
            } label:{
                HStack(spacing:3){
                    Text("Already, have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical,10)
            
        }
    }
}

#Preview {
    RegistrationView()
}
