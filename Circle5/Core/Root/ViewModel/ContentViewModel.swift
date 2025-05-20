//
//  ContentViewModel.swift
//  Circle5
//
//  Created by Maryam Hina on 2025-03-08.
//

/*import Foundation
import Combine
import Firebase
import FirebaseAuth
class ContentViewModel: ObservableObject {
    @Published var userSession:FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    init() {
        setupUserSubsribers()    }
    private func setupUserSubsribers() {
        AuthService.shared.$userSession.sink{[weak self] userSession in
            self?.userSession = userSession
        }
    }
}*/
import Foundation
import Combine
import Firebase
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?

    // ❗Spelling fix: it's 'cancellables' not 'cancellebles'
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupUserSubscribers()
    }

    // ❗Spelling fix in function name: setupUserSubscribers()
    private func setupUserSubscribers() {
        AuthService.shared.$userSession
            .receive(on: DispatchQueue.main) // ensure UI updates on main thread
            .sink { [weak self] userSession in
                self?.userSession = userSession
            }
            .store(in: &cancellables) // 💡 this stores the subscription so it doesn't cancel immediately
    }
}

