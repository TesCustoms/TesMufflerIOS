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
        return view
    }()
    
    let navigationBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()
    
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
        imageView.image = UIImage(systemName: "person.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: UIFont.systemFont(ofSize: 25).pointSize, weight: .regular))?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal)
        imageView.layer.cornerRadius = 80
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User"
        label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "email@gmail.com"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    let memeberSinceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Memeber Since:"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = .gray
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2022"
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = .gray
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
        setScrollView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setScrollView() {
        addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor).isActive = true
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
    
    private func navBarSetUp() {
        addSubview(navigationView)
        navigationView.addSubview(navigationBarView)
        
        navigationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        navigationView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        navigationView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        navigationBarView.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        navigationBarView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        navigationBarView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        navigationBarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        navigationBarView.addSubview(profileLabel)
        
        profileLabel.centerXAnchor.constraint(equalTo: navigationBarView.centerXAnchor).isActive = true
        profileLabel.centerYAnchor.constraint(equalTo: navigationBarView.centerYAnchor).isActive = true
        profileLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        navigationBarView.addSubview(blank2Button)
        
        blank2Button.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 10).isActive = true
        blank2Button.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: -10).isActive = true
        blank2Button.rightAnchor.constraint(equalTo: navigationBarView.rightAnchor,constant: -10).isActive = true
        blank2Button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        navigationBarView.addSubview(blankButton)
        
        blankButton.topAnchor.constraint(equalTo: navigationBarView.topAnchor, constant: 10).isActive = true
        blankButton.bottomAnchor.constraint(equalTo: navigationBarView.bottomAnchor, constant: -10).isActive = true
        blankButton.rightAnchor.constraint(equalTo: blank2Button.leftAnchor).isActive = true
        blankButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    private func setConstraints() {
        backView.addSubview(profileImageView)
        backView.addSubview(nameLabel)
        backView.addSubview(emailLabel)
        backView.addSubview(memeberSinceLabel)
        backView.addSubview(yearLabel)
        backView.addSubview(vinLabel)
        backView.addSubview(logoutButton)
        
        profileImageView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 40).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        memeberSinceLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15).isActive = true
        memeberSinceLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        memeberSinceLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        memeberSinceLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        yearLabel.topAnchor.constraint(equalTo: memeberSinceLabel.bottomAnchor, constant: 5).isActive = true
        yearLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        yearLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        yearLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        vinLabel.bottomAnchor.constraint(equalTo: logoutButton.topAnchor, constant: -50).isActive = true
        vinLabel.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        vinLabel.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        vinLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        logoutButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5).isActive = true
        logoutButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
