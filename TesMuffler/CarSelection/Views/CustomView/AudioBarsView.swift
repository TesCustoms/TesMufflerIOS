//
//  AudioBarsView.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 3/7/23.
//

import Foundation
import UIKit

class AudioBarsView: UIView {
    
    let barHeights: [CGFloat] = [
        0, 25 ,15, 35, 20, 28,
        45, 40, 5, 25, 15, 30,
        40, 20, 35, 40, 15, 30,
        40, 20, 35, 35, 20, 28,
        40, 18, 5
    ]
    var currentBarIndex = 0
    var timer: Timer?
    var redBars: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        var previousGrayBar: UIView? = nil
        let maxHeight = barHeights.max() ?? 0
        
        for i in 0..<barHeights.count {
            // Create a gray bar
            let grayBar = UIView()
            grayBar.translatesAutoresizingMaskIntoConstraints = false
            grayBar.layer.cornerRadius = 3
            grayBar.backgroundColor = .systemGray
            addSubview(grayBar)
            
            // Create a red bar
            let redBar = UIView()
            redBar.translatesAutoresizingMaskIntoConstraints = false
            redBar.layer.cornerRadius = 3
            redBar.backgroundColor = .systemGray
            addSubview(redBar)
            redBars.append(redBar)
            
            // Set gray bar constraints
            grayBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            grayBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(barHeights[i]) / CGFloat(maxHeight)).isActive = true
            grayBar.widthAnchor.constraint(equalToConstant: 5).isActive = true
            
            if let previous = previousGrayBar {
                grayBar.leftAnchor.constraint(equalTo: previous.rightAnchor, constant: 5).isActive = true
            }
            
            previousGrayBar = grayBar
            
            redBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            redBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(barHeights[i]) / CGFloat(maxHeight)).isActive = true
            redBar.widthAnchor.constraint(equalToConstant: 5).isActive = true
            redBar.leftAnchor.constraint(equalTo: grayBar.leftAnchor).isActive = true
        }
    }
    
    
    func startAnimating(completion: @escaping () -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            let currentRedBar = self.redBars[self.currentBarIndex]
            currentRedBar.frame.size.width = 0
            UIView.animate(withDuration: 0.3, animations: {
                currentRedBar.alpha = 1
                currentRedBar.backgroundColor = .red
                currentRedBar.frame.size.width = self.bounds.width / CGFloat(self.barHeights.count * 2)
                self.layoutIfNeeded()
            }) { finished in
                self.currentBarIndex = (self.currentBarIndex + 1) % self.barHeights.count
                if self.currentBarIndex == 0 {
                    self.timer?.invalidate()
                    completion()
                }
            }
        }
    }
    
    func stopAnimating() {
        timer?.invalidate()
        currentBarIndex = 0
        for redBar in redBars {
            redBar.backgroundColor = .systemGray
            redBar.frame.size.width = 0
            redBar.alpha = 1
        }
    }
}
