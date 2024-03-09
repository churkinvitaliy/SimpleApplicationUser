import Foundation

struct User {
    let id: Int
    let name: String
    let email: String
}

class UserModel {
    static func getUsers() -> [User] {
        return [
            User(id: 1, name: "John Doe", email: "john@example.com"),
            User(id: 2, name: "Jane Smith", email: "jane@example.com"),
        ]
    }
}
