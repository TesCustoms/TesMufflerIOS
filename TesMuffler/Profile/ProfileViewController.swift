/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = ProfileVC setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import UIKit
import PhotosUI
import AVFoundation

class ProfileViewController: UIViewController {
    
    private let contentView = ProfileView()
    private let viewModel = ProfileViewModel()
    private var isCameraAccessGranted = false
    private var isPencilTapped = false
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navSetUp()
        setGestures()
        contentView.logoutButton.addTarget(
            self,
            action: #selector(didTapLogout),
            for: .touchUpInside
        )
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }
    
    private func navSetUp() {
        title = "Profile"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray6
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(systemName: "info.square"),
                style: .plain,
                target: self,
                action: #selector(didTapInfoButton)),
            UIBarButtonItem(
                image: UIImage(systemName: "pencil"),
                style: .plain,
                target: self,
                action: #selector(didTapPencilButton))
        ]
        navigationController?.navigationBar.barTintColor = .systemGray6
    }
    
    private func setGestures() {
        let profileImageTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapImage)
        )
        contentView.profileImageView.addGestureRecognizer(profileImageTapGesture)
    }
    
    private func showCameraAccessDeniedAlert() {
        let alert = UIAlertController(
            title: "Camera Access Denied",
            message: "Please allow camera access in Settings",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Settings", style: .default) { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        })
        present(alert, animated: true)
    }
    
    private func presentPickerController(with source: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @objc
    private func didTapPencilButton() {
        isPencilTapped.toggle()
        contentView.tableView.reloadData()
    }
    
    @objc
    private func didTapInfoButton() {
        
    }
    
    @objc
    private func didTapImage() {
        presentPhotoActionSheet()
    }
    
    @objc
    private func didTapLogout() {
        dismiss(animated: true)
    }
}

//MARK: - Tableview delegate and datasource
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomInfoCell.identifier, for: indexPath) as? CustomInfoCell else { return UITableViewCell() }
        let title = viewModel.cellTitle[indexPath.row]
        let dummyData = viewModel.dummyData[indexPath.row]
        if isPencilTapped == true {
            cell.pencilTappedTrueCellConfig()
        } else {
            cell.pencilTappedFalseCellConfig()
        }
        cell.xButton.tag = indexPath.row
        cell.xButton.addTarget(
            self,
            action: #selector(didTapXButton),
            for: .touchUpInside
        )
        cell.setDetailText(with: dummyData)
        cell.setLabelText(with: title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isPencilTapped == true {
            let label = viewModel.dummyData[indexPath.row]
            let alertController = UIAlertController(title: "Edit Text", message: "", preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.text = label
            }
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
                guard let textField = alertController.textFields?.first else {
                    return
                }
                
                self.viewModel.dummyData[indexPath.row] = textField.text ?? ""
                self.contentView.tableView.reloadData()
            }))
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc private func didTapXButton(_ sender: UIButton) {
        let row = sender.tag
        viewModel.dummyData[row] = ""
        contentView.tableView.reloadData()
    }
}


//MARK: - Camera and PhotoLibrary setup
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private func presentCamera() {
        presentPickerController(with: .camera)
    }
    
    func presentPhotoLibrary() {
        presentPickerController(with: .photoLibrary)
    }
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        actionSheet.addAction(UIAlertAction(
            title: "Take Photo",
            style: .default,
            handler: { [weak self] _ in
                let mediaType = AVMediaType.video
                switch AVCaptureDevice.authorizationStatus(for: mediaType) {
                case .authorized:
                    self?.presentCamera()
                case .notDetermined:
                    AVCaptureDevice.requestAccess(for: mediaType) { granted in
                        DispatchQueue.main.async {
                            if granted {
                                self?.presentCamera()
                            } else {
                                self?.showCameraAccessDeniedAlert()
                            }
                        }
                    }
                case .denied, .restricted:
                    self?.showCameraAccessDeniedAlert()
                @unknown default:
                    fatalError("An error occurred while checking authorization status.")
                }
            }
        ))
        actionSheet.addAction(UIAlertAction(
            title: "Photo Library",
            style: .default,
            handler: { [weak self] _ in
                self?.presentPhotoLibrary()
            }
        ))
        present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        picker.dismiss(animated: true)
        self.contentView.profileImageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
