/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/23
 __deprecated__ = False
 __doc__        = ProfileVC setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation

struct ProfileModel {
    var name: String?
    var email: String?
    var VIN: String?
    var memberSince: String?
    
    init(name: String? = nil, email: String? = nil, VIN: String? = nil, memberSince: String? = nil) {
        self.name = name
        self.email = email
        self.VIN = VIN
        self.memberSince = memberSince
    }
}
