/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/22
 __deprecated__ = False
 __doc__        = CarSelectionVC Setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class CarSelectionViewController: UIViewController {
    
    private let contentView = CarSelectionView()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    @objc
    private func settingsButtonTapped() {
        let settingsVC = VolumeSettingsViewController()
        let navigationController = UINavigationController(
            rootViewController: settingsVC
        )
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

extension CarSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarSelectionCustomCell.identifier, for: indexPath) as? CarSelectionCustomCell else { return UITableViewCell() }
        cell.settingsButton.addTarget(
            self,
            action: #selector(settingsButtonTapped),
            for: .touchUpInside
        )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
