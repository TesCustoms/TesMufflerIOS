/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = SignUpScreen view setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class SignUpScreenView: UIView {
    
    let navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let signUpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign Up"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    
    let verifyEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Verify Email"
        return label
    }()
    
    let veryifyEmailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let vinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "VIN"
        return label
    }()
    
    let vinTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let howDidYouHearAboutUsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("How did you hear about us?", for: .normal)
        button.setTitleColor(UIColor.link, for: .normal)
        return button
    }()
    
    let letsRideButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Let's Ride!", for: .normal)
        button.backgroundColor = .link
        button.layer.cornerRadius = 5
        button.setTitleColor(UIColor.white, for: .normal)
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
        addSubview(navigationView)
        addSubview(nameLabel)
        addSubview(nameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(verifyEmailLabel)
        addSubview(veryifyEmailTextField)
        addSubview(vinLabel)
        addSubview(vinTextField)
        addSubview(howDidYouHearAboutUsButton)
        addSubview(letsRideButton)
        
        navigationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        navigationView.addSubview(signUpLabel)
        
        signUpLabel.leftAnchor.constraint(equalTo: navigationView.leftAnchor).isActive = true
        signUpLabel.topAnchor.constraint(equalTo: navigationView.topAnchor)
            .isActive = true
        signUpLabel.rightAnchor.constraint(equalTo: navigationView.rightAnchor).isActive = true
        signUpLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: navigationView.bottomAnchor,constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 20).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        verifyEmailLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20).isActive = true
        verifyEmailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        verifyEmailLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        verifyEmailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        veryifyEmailTextField.topAnchor.constraint(equalTo: verifyEmailLabel.bottomAnchor).isActive = true
        veryifyEmailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        veryifyEmailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        veryifyEmailTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        vinLabel.topAnchor.constraint(equalTo: veryifyEmailTextField.bottomAnchor,constant: 50).isActive = true
        vinLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        vinLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        vinLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        vinTextField.topAnchor.constraint(equalTo: vinLabel.bottomAnchor).isActive = true
        vinTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        vinTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        vinTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        howDidYouHearAboutUsButton.topAnchor.constraint(equalTo: vinTextField.bottomAnchor, constant: 40).isActive = true
        howDidYouHearAboutUsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        howDidYouHearAboutUsButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        howDidYouHearAboutUsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        letsRideButton.topAnchor.constraint(equalTo: howDidYouHearAboutUsButton.bottomAnchor, constant: 50).isActive = true
        letsRideButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        letsRideButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        letsRideButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
