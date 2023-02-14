/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/13
 __deprecated__ = False
 __doc__        = Scene Delegate
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = LoginScreenViewController()
        window?.makeKeyAndVisible()
    }
}
