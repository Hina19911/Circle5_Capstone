//
//  RegistrationViewModel.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-02-28.
//

import Foundation
class RegistrationViewModel:ObservableObject{
    @Published  var email = ""
    @Published  var password = ""
    @Published  var fulname = ""
    @Published  var username = ""
    
    @MainActor
    func createUser() async throws{
        try await
        AuthService.shared
            .createUser(
                withEmail: email,
                password: password,
                fulname: fulname,
                username: username    )
        
    }}

