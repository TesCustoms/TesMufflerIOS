/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = Tab bar setup for TesCustomsVC and ProfileVC
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tabBar.barTintColor = .systemGray6
        setControllers()
    }
    
    private func setControllers() {
        let CarSelectionVC = CarSelectionViewController(
            settingsModelController: SettingsModelController.shared,
            audioManager: AudioManager.shared
        )
        CarSelectionVC.tabBarItem = UITabBarItem(
            title: "Connect",
            image: UIImage(systemName: "app.connected.to.app.below.fill"),
            tag: 1)
        let profileVC = ProfileViewController()
        let navigationController = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.circle"),
            tag: 1)
        
        self.setViewControllers([CarSelectionVC, navigationController], animated: true)
    }
}
