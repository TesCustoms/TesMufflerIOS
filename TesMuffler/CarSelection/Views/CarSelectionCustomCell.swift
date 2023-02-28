//
//  CarSelectionCustomCell.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 2/22/23.
//

import Foundation
import UIKit

class CarSelectionCustomCell: UITableViewCell {
    
    static let identifier = {
        String(describing: CarSelectionCustomCell.self)
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .gray
        return view
    }()
    
    private let vehicleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        return label
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(
            systemName: "slider.horizontal.3",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: UIFont.systemFont(ofSize: 30).pointSize,
                weight: .regular))?.withTintColor(
                    .white,
                    renderingMode: .alwaysOriginal
                )
        button.setImage(image, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        contentView.addSubview(containerView)
        
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        
        containerView.addSubview(vehicleLabel)
        
        vehicleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 50).isActive = true
        vehicleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        vehicleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        vehicleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.addSubview(settingsButton)
        
        settingsButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        settingsButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}