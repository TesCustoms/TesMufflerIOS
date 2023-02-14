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
    
    let navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.lightGray.cgColor
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
    
    let blankButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        return button
    }()
    
    let blank2Button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "info.square"), for: .normal)
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "me")
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Alex"
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
//        label.backgroundColor = .gray
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "email@gmail.com"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
//        label.backgroundColor = .gray
        return label
    }()
    
    let memeberSinceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Memeber Since:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
//        label.backgroundColor = .gray
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2022"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
//        label.backgroundColor = .gray
        return label
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
    
    let vinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VIN#: 123456789ABC"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        navBarSetUp()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(memeberSinceLabel)
        addSubview(yearLabel)
        addSubview(vinLabel)
        addSubview(logoutButton)
        
        profileImageView.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 40).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        memeberSinceLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15).isActive = true
        memeberSinceLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        memeberSinceLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        memeberSinceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        yearLabel.topAnchor.constraint(equalTo: memeberSinceLabel.bottomAnchor, constant: 5).isActive = true
        yearLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        yearLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        yearLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        vinLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -5).isActive = true
        vinLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        vinLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        vinLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        logoutButton.bottomAnchor.constraint(equalTo: vinLabel.topAnchor, constant: -10).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    private func navBarSetUp() {
        addSubview(navigationView)
        addSubview(profileLabel)
        
        navigationView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        navigationView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        navigationView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        navigationView.addSubview(profileLabel)
        
        profileLabel.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor).isActive = true
        profileLabel.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor).isActive = true
        profileLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        navigationView.addSubview(blank2Button)
        
        blank2Button.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 10).isActive = true
        blank2Button.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -10).isActive = true
        blank2Button.rightAnchor.constraint(equalTo: navigationView.rightAnchor,constant: -10).isActive = true
        blank2Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        navigationView.addSubview(blankButton)
        
        blankButton.topAnchor.constraint(equalTo: navigationView.topAnchor, constant: 10).isActive = true
        blankButton.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: -10).isActive = true
        blankButton.rightAnchor.constraint(equalTo: blank2Button.leftAnchor).isActive = true
        blankButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
