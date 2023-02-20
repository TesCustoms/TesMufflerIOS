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
        setButtonTargets()
        setTextFieldDelegates()
        setGestures()
    }
    
    private func setTextFieldDelegates() {
        contentView.emailTextField.delegate = self
        contentView.vinTextField.delegate = self
        contentView.nameTextField.delegate = self
        contentView.veryifyEmailTextField.delegate = self
    }
    
    private func setButtonTargets() {
        contentView.letsRideButton.addTarget(
            self,
            action: #selector(didTapLetsRide),
            for: .touchUpInside
        )
        contentView.backButton.addTarget(
            self,
            action: #selector(didTapBackButton),
            for: .touchUpInside
        )
    }
    
    @objc
    private func didTapLetsRide() {
        contentView.setUpFieldErrors({[weak self] name, email, vin in
            self?.viewModel.signUpModel = SignUpModel(name: name, email: email, vin: vin)
            self?.userModelController.domainModel = UserDomainModel(self?.viewModel.signUpModel)
            self?.dismiss(animated: true)
        })
    }
    
    @objc
    private func didTapBackButton() {
        dismiss(animated: true)
    }
    
    private func setGestures() {
        let tapDismissKeyboardGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapScreen)
        )
        view.addGestureRecognizer(tapDismissKeyboardGesture)
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
