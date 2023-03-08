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
    
    private let settingsModelController: SettingsModelController
    private let viewModel = CarSelectionViewModel()
    private let contentView = CarSelectionView()
    private var lastSelectedIndexPath: IndexPath?
    private var cellIndex = Int()
    
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
        contentView.soundPlayerView.playButton.addTarget(
            self,
            action: #selector(didTapPlay),
            for: .touchUpInside
        )
    }
    
    @objc
    private func didTapPlay() {
        guard contentView.soundPlayerView.carTitleLabel.text != "Select A Car Sound" else {
            let alertController = UIAlertController(title: "Car Not Selected!\n", message: "To play a vehicle sound, please select one of the following options below.\n\nThank you!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default)
            alertController.addAction(action)
            present(alertController, animated: true)
            return
        }
        self.contentView.soundPlayerView.audioBarsView.stopAnimating()
        self.contentView.soundPlayerView.setRestartButton()
        contentView.soundPlayerView.audioBarsView.startAnimating { [weak self] in
            self?.contentView.soundPlayerView.setPlayButton()
        }
    }
    
    @objc
    private func settingsButtonTapped(_ sender: UIButton) {
        let settingsVC = VolumeSettingsViewController(
            settingsModelController: SettingsModelController.shared
        )
        let data = viewModel.dummyData[sender.tag]
        guard let photoData = viewModel.carImages[sender.tag] else { return }
        let navigationController = UINavigationController(
            rootViewController: settingsVC
        )
        navigationController.modalPresentationStyle = .fullScreen
        settingsModelController.setDomainData(with: data, and: photoData)
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
        let selectedCell = tableView.cellForRow(at: indexPath) as? CarSelectionCustomCell
        selectedCell?.containerView.backgroundColor = UIColor(cgColor:  CGColor(red: 167/255, green: 5/255, blue: 23/255, alpha: 1.0)).withAlphaComponent(0.9)
        selectedCell?.containerView.layer.borderWidth = 1.0
        if let lastSelectedIndexPath = lastSelectedIndexPath {
            let lastSelectedCell = tableView.cellForRow(at: lastSelectedIndexPath) as? CarSelectionCustomCell
            lastSelectedCell?.containerView.backgroundColor = .gray.withAlphaComponent(0.5)
            lastSelectedCell?.containerView.layer.borderWidth = 0.2
        }
        lastSelectedIndexPath = indexPath
        tableView.deselectRow(at: indexPath, animated: true)
        contentView.soundPlayerView.carTitleLabel.text = viewModel.dummyData[indexPath.row]
        contentView.soundPlayerView.audioBarsView.stopAnimating()
        contentView.soundPlayerView.setPlayButton()
    }
}

