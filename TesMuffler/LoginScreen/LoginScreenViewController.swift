/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = LoginScreenVC setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import UIKit

class LoginScreenViewController: UIViewController {
    
    private let contentView = LoginScreenView()
    private var keyboardIsShown = false
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGestures()
        setUpKeyboardNotifications()
        contentView.signUpButton.addTarget(
            self,
            action: #selector(didTapSignUp),
            for: .touchUpInside
        )
        contentView.enterButton.addTarget(
            self,
            action: #selector(didTapEnter),
            for: .touchUpInside
        )
        contentView.emailTextField.delegate = self
        contentView.passwordTextField.delegate = self
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        contentView.emailTextField.text?.removeAll()
        contentView.passwordTextField.text?.removeAll()
    }
    
    private func setUpKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func keyboardWillShow() {
        if !keyboardIsShown {
            contentView.backViewTopConstraint?.constant -= 120
            keyboardIsShown = true
        }
    }
    
    @objc private func keyboardWillHide() {
        if keyboardIsShown {
            contentView.backViewTopConstraint?.constant += 120
            keyboardIsShown = false
        }
    }
    
    private func setGestures() {
        let tapDismissKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(didTapScreen))
        view.addGestureRecognizer(tapDismissKeyboardGesture)
    }
    
    @objc
    private func didTapScreen() {
        view.endEditing(true)
    }
    
    @objc
    private func didTapSignUp() {
        let signUpScreenVC = SignUpScreenViewController()
        present(signUpScreenVC, animated: true)
    }
    
    @objc
    private func didTapEnter() {
        guard let email = contentView.emailTextField.text, let password = contentView.passwordTextField.text, !email.isEmpty, !password.isEmpty else {
            let alertController = UIAlertController(title: "Invalid login", message: "Please enter a valid email/password", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: .default))
            present(alertController, animated: true)
            return
        }
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
    }
}

extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
