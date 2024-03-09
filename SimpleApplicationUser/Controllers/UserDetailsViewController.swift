import UIKit

class UserDetailsViewController: UIViewController {

    private var userDetailsView: UserDetailsView {
        guard let view = view as? UserDetailsView else {
            fatalError("Unexpected view type")
        }
        return view
    }

    private let user: User

    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
        title = "User Details"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UserDetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsView.configure(with: user)
    }
}
