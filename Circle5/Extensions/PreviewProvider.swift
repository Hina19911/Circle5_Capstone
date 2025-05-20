import Foundation
import SwiftUI
extension PreviewProvider{
    static var dev:DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    let user = User(id:NSUUID().uuidString, fulname: "Max V", email: "max@gmail.com", username: "Maxverse")
}
