/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = Domain Model data
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation

struct UserDomainModel {
    var name: String?
    var email: String?
    var vin: String?
    
    init(_ signUpModel: SignUpModel? = nil) {
        self.name = signUpModel?.name
        self.email = signUpModel?.email
        self.vin = signUpModel?.vin
    }
}
