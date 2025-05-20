
import Foundation
import Combine
import PhotosUI
import SwiftUI
class CurrentUserProfileViewModel: ObservableObject{
    @Published var currentUser: User?
    @Published var selectedItem:PhotosPickerItem?
    @Published var profileImage:Image?
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

