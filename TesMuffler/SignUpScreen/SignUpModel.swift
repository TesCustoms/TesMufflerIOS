/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = Data model setup for signup screen
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation

struct SignUpModel {
    var name: String?
    var email: String?
    var vin: String?
    
    init(name: String? = nil, email: String? = nil, vin: String? = nil) {
        self.name = name
        self.email = email
        self.vin = vin
    }
}
