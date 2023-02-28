/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = SignUpVC setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    private let contentView = SignUpView()
    private var viewModel = SignUpViewModel()
    private var userModelController: UserModelController
    
    init(userModelController: UserModelController) {
        self.userModelController = userModelController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegates()
        setButtonTargets()
        setGestures()
        setNavBar()
    }
    
    private func setTextFieldDelegates() {
        contentView.veryifyEmailTextField.delegate = self
        contentView.emailTextField.delegate = self
        contentView.nameTextField.delegate = self
        contentView.vinTextField.delegate = self
    }
    
    private func setButtonTargets() {
        contentView.letsRideButton.addTarget(
            self,
            action: #selector(didTapLetsRide),
            for: .touchUpInside
        )
    }
    
    private func setNavBar() {
        title = "Sign Up"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray6
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Log In",
            style: .plain,
            target: self,
            action: #selector(didTapLogIn)
        )
        navigationController?.navigationBar.backgroundColor = .systemGray6
    }
    
    private func setGestures() {
        let tapDismissKeyboardGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapScreen)
        )
        view.addGestureRecognizer(tapDismissKeyboardGesture)
    }
    
    @objc
    private func didTapLogIn() {
        dismiss(animated: true)
    }
    
    @objc
    private func didTapLetsRide() {
        contentView.setUpErrorsHandler { [weak self] name, email, vin in
            self?.viewModel.signUpModel = SignUpModel(
                name: name,
                email: email,
                vin: vin
            )
            self?.userModelController.domainModel = UserDomainModel(self?.viewModel.signUpModel)
            self?.dismiss(animated: true)
        }
    }
    
    @objc
    private func didTapScreen() {
        view.endEditing(true)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

