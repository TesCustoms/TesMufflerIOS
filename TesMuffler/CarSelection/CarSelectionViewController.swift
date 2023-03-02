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
    
    private var cellIndex = Int()
    
    private let contentView = CarSelectionView()
    private let viewModel = CarSelectionViewModel()
    private let settingsModelController: SettingsModelController
    
    init(settingsModelController: SettingsModelController) {
        self.settingsModelController = settingsModelController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    @objc
    private func settingsButtonTapped(_ sender: UIButton) {
        let settingsVC = VolumeSettingsViewController(
            settingsModelController: SettingsModelController.shared
        )
        let data = viewModel.dummyData[sender.tag]
        let navigationController = UINavigationController(
            rootViewController: settingsVC
        )
        navigationController.modalPresentationStyle = .fullScreen
        settingsModelController.setDomainData(with: data)
        present(navigationController, animated: true)
    }
}

extension CarSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarSelectionCustomCell.identifier, for: indexPath) as? CarSelectionCustomCell else { return UITableViewCell() }
        cell.setVehicleLabels(with: viewModel.dummyData[indexPath.row])
        cell.setVehicleImage(with: viewModel.carImages[indexPath.row] ?? UIImage())
        cell.settingsButton.tag = indexPath.row
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
