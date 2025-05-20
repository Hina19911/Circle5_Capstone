//
//  LogInView.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-14.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("Circle5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height:150)
                    .padding()
                //Email and password
                VStack{
                    TextField("Enter your Email", text: $viewModel.email)
                        .autocapitalization(.none)
                    //made modifier in utilites
                        .modifier(Circle5TextFieldModifier())
                    
                    SecureField("Enter your password", text:$viewModel.password)
                    
                        .modifier(Circle5TextFieldModifier())
                }
                //navigation for forgot password
                NavigationLink {Text("Forgot Password?")
                }label:{Text("forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,20)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .foregroundColor(.black)
                }
                
                //Login Button
                Button{
                    Task{try await viewModel.login()}
                }label:{
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width:352,height: 44 )
                        .background(.black)
                        .cornerRadius(8)
                }
                .padding(0.0)
                Spacer()
                
                Divider()
                
                //Footer for sign up
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                }label:
                {
                    HStack(spacing:3){
                    Text("Don't have an account?")
                    Text("Sign Up")
                        .fontWeight(.semibold)
                    
            }
                    
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical,16)
        }
    }
}

#Preview {
    LogInView()
}
