/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = ProfileVC setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    private let contentView = ProfileView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
