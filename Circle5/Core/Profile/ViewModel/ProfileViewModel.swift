import Foundation
import Combine
class ProfileViewModel: ObservableObject{
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSubscribers()
    }
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink{[weak self] user in
            self?.currentUser = user
            print("Debug:User in viewmodel from Combine is\(user)")
        }
        .store(in: &cancellables)
    }
}

