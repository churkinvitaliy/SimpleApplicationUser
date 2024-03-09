import UIKit

class UserListViewController: UIViewController {

    private var userListView: UserListView {
        guard let view = view as? UserListView else {
            fatalError("Unexpected view type")
        }
        return view
    }

    override func loadView() {
        view = UserListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        userListView.delegate = self
    }
}

extension UserListViewController: UserListViewDelegate {
    func didSelectUser(_ user: User) {
        let userDetailsVC = UserDetailsViewController(user: user)
        navigationController?.pushViewController(userDetailsVC, animated: true)
    }
}
