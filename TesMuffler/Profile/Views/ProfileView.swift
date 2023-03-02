/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = ProfileView setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class ProfileView: UIView {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: UIFont.systemFont(ofSize: 25).pointSize, weight: .regular))?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        imageView.layer.cornerRadius = 80
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            CustomInfoCell.self,
            forCellReuseIdentifier: CustomInfoCell.identifier
        )
        tableView.separatorColor = .black
        tableView.separatorStyle = .singleLine
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setScrollView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setScrollView() {
        addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        
        scrollView.addSubview(backView)
        
        backView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 700).isActive = true
        backView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollView.contentSize = CGSize(width: .zero, height: 700)
    }
    
    private func setConstraints() {
        backView.addSubview(profileImageView)
        backView.addSubview(tableView)
        backView.addSubview(logoutButton)
        
        profileImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 40).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        tableView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30).isActive = true
        tableView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -25).isActive = true
        tableView.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -20).isActive = true
        
        logoutButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
