/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/16
 __deprecated__ = False
 __doc__        = Setting up SignUpViewModel for data usage inside SignUpVC
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */


import Foundation

class SignUpViewModel {
    
    var modelController: UserModelController
    
    init(modelController: UserModelController) {
        self.modelController = modelController
    }
    
    var signUpModel: SignUpModel?
    
    func setUpDomainData() {
        modelController.domainModel = UserDomainModel(signUpModel)
    }
}
