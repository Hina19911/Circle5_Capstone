import Foundation
struct User: Identifiable,Codable,Hashable{
    let id: String
    let fulname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
