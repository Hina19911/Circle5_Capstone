//
//  AuthService.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-03-01.
//
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    /*static let id = AuthService()*/
    static let shared = AuthService()
    init() {
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("DEBUG: User created with uid: \(result.user.uid)")
        }catch{
            print ("Debug: Failed to create user: \(error.localizedDescription)")
        }
        
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fulname: String,username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fulname: fulname, username: username, id: result.user.uid)
            print("DEBUG: User created with uid: \(result.user.uid)")
        }catch{
            print ("Debug: Failed to create user: \(error.localizedDescription)")
        }
        
    }
    
    func signOut(){
        try? Auth.auth().signOut() //signs us out on backend
        self.userSession = nil //this removes session locally and updates routing
        UserService.shared.reset()//set current user object to nill
    }
    @MainActor
    private func uploadUserData(withEmail email: String,
                                fulname: String,
                                username: String,
                                id:String)async throws{
        let user = User(id:id, fulname: fulname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}

