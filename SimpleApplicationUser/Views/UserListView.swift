import UIKit

protocol UserListViewDelegate: AnyObject {
    func didSelectUser(_ user: User)
}

class UserListView: UIView {

    weak var delegate: UserListViewDelegate?

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private var users: [User] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
        loadData()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupHierarchy()
        setupLayout()
        loadData()
    }

    private func setupView() {
        backgroundColor = .white
    }

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func loadData() {
        users = UserModel.getUsers()
        tableView.reloadData()
    }
}

extension UserListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.cellIdentifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }

        let user = users[indexPath.row]
        cell.configure(with: user)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = users[indexPath.row]
        delegate?.didSelectUser(selectedUser)
    }
}
