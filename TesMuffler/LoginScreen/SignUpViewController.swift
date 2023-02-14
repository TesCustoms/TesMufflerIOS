/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/13
 __deprecated__ = False
 __doc__        = LoginScreenVC controller setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import UIKit

class LoginScreenViewController: UIViewController {
    
    let contentView = LoginScreenView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
