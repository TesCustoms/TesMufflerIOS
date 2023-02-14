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
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    
    @objc
    private func didTapSignUp() {
        let signUpScreenVC = SignUpScreenViewController()
        present(signUpScreenVC, animated: true)
    }
    
    @objc
    private func didTapEnter() {
        let tabBarVC = TabBarController()
        present(tabBarVC, animated: true)
    }
}
