import UIKit
import SnapKit

class UserDetailsView: UIView {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()

    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()

    init() {
        super.init(frame: .zero)
        setupView()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupHierarchy()
        setupLayout()
    }

    private func setupView() {
        backgroundColor = .white
    }

    private func setupHierarchy() {
        addSubview(nameLabel)
        addSubview(emailLabel)
    }

    private func setupLayout() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }

        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
