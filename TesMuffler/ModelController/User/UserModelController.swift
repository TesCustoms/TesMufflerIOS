/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/16
 __deprecated__ = False
 __doc__        = Domain Model for setting up users
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation

class UserModelController {
    
    static let shared = UserModelController()
    private init() {}
    
    var domainModel = UserDomainModel()
}
