/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/22
 __deprecated__ = False
 __doc__        = CarSelectionView setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class CarSelectionView: UIView {
    
    let soundPlayerView = SoundPlayerView()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(
            CarSelectionCustomCell.self,
            forCellReuseIdentifier: CarSelectionCustomCell.identifier
        )
        tableView.separatorColor = .clear
        return tableView
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
        addSubview(soundPlayerView)
        addSubview(tableView)
        
        soundPlayerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        soundPlayerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        soundPlayerView.rightAnchor.constraint(equalTo: rightAnchor,constant:  -10).isActive = true
        soundPlayerView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        tableView.topAnchor.constraint(equalTo: soundPlayerView.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
