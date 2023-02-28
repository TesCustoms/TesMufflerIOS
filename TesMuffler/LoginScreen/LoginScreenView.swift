/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/13
 __deprecated__ = False
 __doc__        = LoginScreenView setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class LoginScreenView: UIView {
    
    var backViewTopConstraint: NSLayoutConstraint?
    
    private let backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let brandTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "TesCustoms"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        title.textAlignment = .center
        return title
    }()
    
    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let logInTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Log In"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        title.textAlignment = .center
        return title
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "E-mail"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 5
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(backView)
        backView.addSubview(brandTitleLabel)
        backView.addSubview(brandImageView)
        backView.addSubview(logInTitleLabel)
        backView.addSubview(emailTextField)
        backView.addSubview(passwordTextField)
        backView.addSubview(enterButton)
        backView.addSubview(signUpButton)
        
        backViewTopConstraint = backView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor)
        backViewTopConstraint?.isActive = true
        backView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        brandTitleLabel.topAnchor.constraint(equalTo: backView.topAnchor).isActive = true
        brandTitleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        brandTitleLabel.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        brandTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        brandImageView.topAnchor.constraint(equalTo: brandTitleLabel.bottomAnchor, constant: 20).isActive = true
        brandImageView.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        brandImageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        brandImageView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        logInTitleLabel.topAnchor.constraint(equalTo: brandImageView.bottomAnchor, constant: 30).isActive = true
        logInTitleLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        logInTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInTitleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor).isActive = true
        logInTitleLabel.rightAnchor.constraint(equalTo: backView.rightAnchor).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: logInTitleLabel.bottomAnchor, constant: 10).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 13).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 180).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        enterButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        
        signUpButton.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 40).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
    }
}
