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
        label.text = "Select A Car Sound"
        label.textAlignment = .center
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.font = customFont
        return label
    }()
    
    let audioBarsView = AudioBarsView()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let symbolName = "play.circle.fill"
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
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 0.2
        layer.cornerRadius = 15
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContraints() {
        addSubview(carTitleLabel)
        addSubview(audioBarsView)
        addSubview(playButton)
        
        carTitleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5).isActive = true
        carTitleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        carTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        carTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        audioBarsView.topAnchor.constraint(equalTo: carTitleLabel.bottomAnchor,constant: 15).isActive = true
        audioBarsView.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 5).isActive = true
        audioBarsView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        audioBarsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        
        playButton.topAnchor.constraint(equalTo: carTitleLabel.bottomAnchor, constant: 15).isActive = true
        playButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setPlayButton() {
        let symbolName = "play.circle.fill"
        let font = UIFont.systemFont(ofSize: 50)
        let image = UIImage(
            systemName: symbolName,
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: font.pointSize,
                weight: .regular))?.withTintColor(
                    .black,
                    renderingMode: .alwaysOriginal
                )
        playButton.setImage(image, for: .normal)
    }
    
    func setRestartButton() {
        let symbolName = "arrow.clockwise.circle.fill"
        let font = UIFont.systemFont(ofSize: 50)
        let image = UIImage(
            systemName: symbolName,
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: font.pointSize,
                weight: .regular))?.withTintColor(
                    .black,
                    renderingMode: .alwaysOriginal
                )
        playButton.setImage(image, for: .normal)
    }
}
