/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = VolumeSettingsVC setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class VolumeSettingsViewController: UIViewController {
    
    private let contentView = VolumeSettingsView()
    private let viewModel = VolumeSettingsViewModel()
    private var settingsModelController: SettingsModelController
    
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
        slideBarTargetSetup()
        setUpModelData()
    }
    
    private func setUpModelData() {
        viewModel.setUpSettingsModel(
            with: settingsModelController.domainModel.title ?? ""
        )
        contentView.setVehicleTitle(
            with: viewModel.volumeSettingsModel.title ?? ""
        )
    }
    
    private func slideBarTargetSetup() {
        title = nil
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(didTapBack)
        )
        contentView.hornSliderBar.addTarget(
            self,
            action: #selector(didMoveHornSlider),
            for: .valueChanged
        )
        contentView.acceleratorSliderBar.addTarget(
            self,
            action: #selector(didMoveAcceleratorSlider),
            for: .valueChanged
        )
        contentView.idleSliderBar.addTarget(
            self,
            action: #selector(didMoveIdleSlider),
            for: .valueChanged
        )
    }
    
    @objc
    private func didTapBack() {
        dismiss(animated: true)
    }
    
    @objc
    private func didMoveHornSlider() {
        contentView.updateHornPercentage()
    }
    
    @objc
    private func didMoveAcceleratorSlider() {
        contentView.updateAcceleratorPercentage()
    }
    
    @objc
    private func didMoveIdleSlider() {
        contentView.updateIdlePercentage()
    }
}
