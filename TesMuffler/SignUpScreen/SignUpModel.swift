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
    let name: String
    let email: String
    let verifyEmail: String
    let vin: String
}