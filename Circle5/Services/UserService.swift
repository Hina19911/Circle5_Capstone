/*import Firebase
import FirebaseFirestore
class UserService {
    @Published var currentUser:User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser()async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let snapshot = try await Firestore.firestore.collection("users").document(uid).getDocument()
    }
}*/
import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
// Define your User model first (Codable & Identifiable)

class UserService: ObservableObject {
    @Published var currentUser: User?
    static let shared = UserService()
    /* init() {
     Task{try await fetchCurrentUser()}
     }*/
    
    init() {
        Task {
           try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("DEBUG: No user is currently signed in.")
            return
        }
        
        do {
            let snapshot = try await Firestore.firestore()
                .collection("users")
                .document(uid)
                .getDocument()
            let user = try snapshot.data(as:User.self)
            self.currentUser = try snapshot.data(as: User.self)
            self.currentUser = user
            
            print("DEBUG: Fetched user \(self.currentUser?.username ?? "")")
        } catch {
            print("DEBUG: Failed to fetch user: \(error.localizedDescription)")
        }
    }
        static func fetchUsers() async throws -> [User] {
            guard let currentUid = Auth.auth().currentUser?.uid else {return []}
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            let users = snapshot.documents.compactMap({try? $0.data(as: User.self)})
            return users.filter({$0.id != currentUid})
        }

        func reset() {
            self.currentUser = nil
        }
    }

