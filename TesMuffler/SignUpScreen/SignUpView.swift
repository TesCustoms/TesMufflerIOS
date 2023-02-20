/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = SignUp view setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class SignUpView: UIView {
    
    let navigationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.borderWidth = 0.2
        view.layer.borderColor = UIColor.lightGray.cgColor
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
    
    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(.link, for: .normal)
        return button
    }()
    
    let signUpNavLabel: UILabel = {
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
        label.text = "Full name"
        return label
    }()
    
    let nameErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.textAlignment = .right
        label.text = "Name missing*"
        label.isHidden = true
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
    
    let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.text = "Invalid Email*"
        label.textAlignment = .right
        label.isHidden = true
        return label
    }()
    
    
    let verifyEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Verify Email"
        return label
    }()
    
    let verifyEmailErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.text = "Unverifed Email*"
        label.textAlignment = .right
        label.isHidden = true
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
    
    let vinErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.text = "VIN missing*"
        label.textAlignment = .right
        label.isHidden = true
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
        navBarSetUp()
        setScrollView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func navBarSetUp() {
        addSubview(navigationView)
        navigationView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        navigationView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        navigationView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        navigationView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        navigationView.addSubview(signUpNavLabel)
        
        signUpNavLabel.leftAnchor.constraint(equalTo: navigationView.leftAnchor).isActive = true
        signUpNavLabel.topAnchor.constraint(equalTo: navigationView.topAnchor)
            .isActive = true
        signUpNavLabel.rightAnchor.constraint(equalTo: navigationView.rightAnchor).isActive = true
        signUpNavLabel.bottomAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        
        navigationView.addSubview(backButton)
        
        backButton.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: navigationView.leftAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setScrollView() {
        addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: navigationView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        
        scrollView.addSubview(backView)
        
        backView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        backView.heightAnchor.constraint(equalToConstant: 800).isActive = true
        backView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollView.contentSize = CGSize(width: .zero, height: 800)
    }
    
    private func setConstraints() {
        backView.addSubview(nameLabel)
        backView.addSubview(nameErrorLabel)
        backView.addSubview(nameTextField)
        backView.addSubview(emailLabel)
        backView.addSubview(emailErrorLabel)
        backView.addSubview(emailTextField)
        backView.addSubview(verifyEmailLabel)
        backView.addSubview(verifyEmailErrorLabel)
        backView.addSubview(veryifyEmailTextField)
        backView.addSubview(vinLabel)
        backView.addSubview(vinErrorLabel)
        backView.addSubview(vinTextField)
        backView.addSubview(howDidYouHearAboutUsButton)
        backView.addSubview(letsRideButton)
        
        nameLabel.topAnchor.constraint(equalTo: backView.topAnchor,constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameErrorLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10).isActive = true
        nameErrorLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameErrorLabel.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameErrorLabel.rightAnchor.constraint(equalTo: nameTextField.rightAnchor).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,constant: 20).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailErrorLabel.leftAnchor.constraint(equalTo: emailLabel.rightAnchor, constant: 10).isActive = true
        emailErrorLabel.topAnchor.constraint(equalTo: emailLabel.topAnchor).isActive = true
        emailErrorLabel.bottomAnchor.constraint(equalTo: emailLabel.bottomAnchor).isActive = true
        emailErrorLabel.rightAnchor.constraint(equalTo: emailTextField.rightAnchor).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        verifyEmailLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 20).isActive = true
        verifyEmailLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        verifyEmailLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        verifyEmailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        verifyEmailErrorLabel.leftAnchor.constraint(equalTo: verifyEmailLabel.rightAnchor, constant: 10).isActive = true
        verifyEmailErrorLabel.topAnchor.constraint(equalTo: verifyEmailLabel.topAnchor).isActive = true
        verifyEmailErrorLabel.bottomAnchor.constraint(equalTo: verifyEmailLabel.bottomAnchor).isActive = true
        verifyEmailErrorLabel.rightAnchor.constraint(equalTo: veryifyEmailTextField.rightAnchor).isActive = true
        
        veryifyEmailTextField.topAnchor.constraint(equalTo: verifyEmailLabel.bottomAnchor).isActive = true
        veryifyEmailTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        veryifyEmailTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        veryifyEmailTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        vinLabel.topAnchor.constraint(equalTo: veryifyEmailTextField.bottomAnchor,constant: 50).isActive = true
        vinLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        vinLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        vinLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        vinErrorLabel.leftAnchor.constraint(equalTo: vinLabel.rightAnchor, constant: 10).isActive = true
        vinErrorLabel.topAnchor.constraint(equalTo: vinLabel.topAnchor).isActive = true
        vinErrorLabel.bottomAnchor.constraint(equalTo: vinLabel.bottomAnchor).isActive = true
        vinErrorLabel.rightAnchor.constraint(equalTo: vinTextField.rightAnchor).isActive = true
        
        vinTextField.topAnchor.constraint(equalTo: vinLabel.bottomAnchor).isActive = true
        vinTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 60).isActive = true
        vinTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        vinTextField.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        howDidYouHearAboutUsButton.topAnchor.constraint(equalTo: vinTextField.bottomAnchor, constant: 40).isActive = true
        howDidYouHearAboutUsButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
        howDidYouHearAboutUsButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        howDidYouHearAboutUsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        letsRideButton.topAnchor.constraint(equalTo: howDidYouHearAboutUsButton.bottomAnchor, constant: 50).isActive = true
        letsRideButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        letsRideButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        letsRideButton.centerXAnchor.constraint(equalTo: backView.centerXAnchor).isActive = true
    }
    
    func setUpFieldErrors(_ completion: @escaping (String, String, String) -> Void) {
        var hasError = false
        
        if nameTextField.text == "" {
            nameErrorLabel.isHidden = false
            hasError = true
        } else {
            nameErrorLabel.isHidden = true
        }
        
        if !isValidEmail(email: emailTextField.text ?? "") {
                emailErrorLabel.isHidden = false
                hasError = true
            } else {
                emailErrorLabel.isHidden = true
            }
        
        if veryifyEmailTextField.text == "" || veryifyEmailTextField.text != emailTextField.text {
            verifyEmailErrorLabel.isHidden = false
            hasError = true
        } else {
            verifyEmailErrorLabel.isHidden = true
        }
        
        if vinTextField.text == "" {
            vinErrorLabel.isHidden = false
            hasError = true
        } else {
            vinErrorLabel.isHidden = true
        }
        
        guard !hasError else {
            return
        }
        
        completion(nameTextField.text ?? "", emailTextField.text ?? "", vinTextField.text ?? "")
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
