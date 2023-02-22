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
import AVFoundation

class ProfileViewController: UIViewController {

    private let contentView = ProfileView()
    private var cameraAccessGranted = false

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setGestures()
        contentView.logoutButton.addTarget(
            self,
            action: #selector(didTapLogout),
            for: .touchUpInside
        )
    }
    
    private func setGestures() {
        let profileImageTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(didTapImage)
        )
        contentView.profileImageView.addGestureRecognizer(profileImageTapGesture)
    }

    @objc
    private func didTapImage() {
        presentPhotoActionSheet()
    }

    @objc
    private func didTapLogout() {
        dismiss(animated: true)
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

}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func presentCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }

    func presentPhotoLibrary() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
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
                case .denied:
                    self?.showCameraAccessDeniedAlert()
                case .restricted:
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
