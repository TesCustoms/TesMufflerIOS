/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = VolumeSettings View setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class VolumeSettingsView: UIView {
    
    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let brandTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "TesCustoms"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        title.textAlignment = .center
        return title
    }()
    
    private let hornTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Horn"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        return title
    }()
    
    let hornSliderBar: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        return slider
    }()
    
    let hornPercentStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0%"
        return label
    }()
    
    let acceleratorTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Accelerator"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        return title
    }()
    
    let acceleratorSliderBar: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        return slider
    }()
    
    let acceleratorPercentStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0%"
        return label
    }()
    
    let idleTitleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Idle"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        return title
    }()
    
    let idleSliderBar: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        return slider
    }()
    
    let idlePercentStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0%"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(brandImageView)
        addSubview(brandTitleLabel)
        addSubview(hornTitleLabel)
        addSubview(hornSliderBar)
        addSubview(hornPercentStatusLabel)
        addSubview(acceleratorTitleLabel)
        addSubview(acceleratorSliderBar)
        addSubview(acceleratorPercentStatusLabel)
        addSubview(idleTitleLabel)
        addSubview(idleSliderBar)
        addSubview(idlePercentStatusLabel)
        
        brandImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        brandImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        brandImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        brandImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        brandTitleLabel.topAnchor.constraint(equalTo: brandImageView.bottomAnchor, constant: 5).isActive = true
        brandTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        brandTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        brandTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        hornTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        hornTitleLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        hornTitleLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        hornTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        hornSliderBar.topAnchor.constraint(equalTo: hornTitleLabel.bottomAnchor,constant: 20).isActive = true
        hornSliderBar.leftAnchor.constraint(equalTo: hornTitleLabel.leftAnchor).isActive = true
        hornSliderBar.widthAnchor.constraint(equalToConstant: 275).isActive = true
        hornSliderBar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        hornPercentStatusLabel.topAnchor.constraint(equalTo: hornSliderBar.topAnchor, constant: -5).isActive = true
        hornPercentStatusLabel.leftAnchor.constraint(equalTo: hornSliderBar.rightAnchor, constant: 30).isActive = true
        hornPercentStatusLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        hornPercentStatusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        acceleratorTitleLabel.topAnchor.constraint(equalTo: hornPercentStatusLabel.bottomAnchor,constant: 30).isActive = true
        acceleratorTitleLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        acceleratorTitleLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        acceleratorTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        acceleratorSliderBar.topAnchor.constraint(equalTo: acceleratorTitleLabel.bottomAnchor,constant: 20).isActive = true
        acceleratorSliderBar.leftAnchor.constraint(equalTo: hornTitleLabel.leftAnchor).isActive = true
        acceleratorSliderBar.widthAnchor.constraint(equalToConstant: 275).isActive = true
        acceleratorSliderBar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        acceleratorPercentStatusLabel.topAnchor.constraint(equalTo: acceleratorSliderBar.topAnchor, constant: -5).isActive = true
        acceleratorPercentStatusLabel.leftAnchor.constraint(equalTo: hornSliderBar.rightAnchor, constant: 30).isActive = true
        acceleratorPercentStatusLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        acceleratorPercentStatusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        idleTitleLabel.topAnchor.constraint(equalTo: acceleratorPercentStatusLabel.bottomAnchor,constant: 30).isActive = true
        idleTitleLabel.leftAnchor.constraint(equalTo: leftAnchor,constant: 30).isActive = true
        idleTitleLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        idleTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

        idleSliderBar.topAnchor.constraint(equalTo: idleTitleLabel.bottomAnchor,constant: 20).isActive = true
        idleSliderBar.leftAnchor.constraint(equalTo: idleTitleLabel.leftAnchor).isActive = true
        idleSliderBar.widthAnchor.constraint(equalToConstant: 275).isActive = true
        idleSliderBar.heightAnchor.constraint(equalToConstant: 20).isActive = true

        idlePercentStatusLabel.topAnchor.constraint(equalTo: idleSliderBar.topAnchor, constant: -5).isActive = true
        idlePercentStatusLabel.leftAnchor.constraint(equalTo: idleSliderBar.rightAnchor, constant: 30).isActive = true
        idlePercentStatusLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        idlePercentStatusLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func updateHornPercentage() {
        hornPercentStatusLabel.text = "\(Int(hornSliderBar.value))%"
    }
    
    func updateAcceleratorPercentage() {
        acceleratorPercentStatusLabel.text = "\(Int(acceleratorSliderBar.value))%"
    }
    
    func updateIdlePercentage() {
        idlePercentStatusLabel.text = "\(Int(idleSliderBar.value))%"
    }
}
