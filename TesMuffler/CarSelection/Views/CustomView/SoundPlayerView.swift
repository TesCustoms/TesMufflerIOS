//
//  SoundPlayerView.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/6/23.
//

import Foundation
import UIKit

class SoundPlayerView: UIView {
    
    let carTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Testing"
        label.textAlignment = .center
        return label
    }()
    
    let pauseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let symbolName = "pause.circle.fill"
        let font = UIFont.systemFont(ofSize: 50)
        let image = UIImage(
            systemName: symbolName,
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: font.pointSize,
                weight: .regular))?.withTintColor(
                    .black,
                    renderingMode: .alwaysOriginal
                )
        button.setImage(image, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 0.2
        layer.cornerRadius = 25
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContraints() {
        addSubview(carTitleLabel)
        addSubview(pauseButton)
        
        carTitleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        carTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        carTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        carTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        pauseButton.topAnchor.constraint(equalTo: carTitleLabel.bottomAnchor, constant: 10).isActive = true
        pauseButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
