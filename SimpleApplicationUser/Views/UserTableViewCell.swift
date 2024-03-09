import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {

    static let cellIdentifier = "userCellIdentifier"

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupHierarchy() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
    }

    private func setupLayout() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.leading.trailing.equalTo(contentView).inset(16)
        }

        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(contentView).inset(16)
            make.bottom.equalTo(contentView).inset(8)
        }
    }

    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
