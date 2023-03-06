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
    
    let playerView = SoundPlayerView()
    
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
        addSubview(playerView)
        addSubview(tableView)
        
        playerView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        playerView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        playerView.rightAnchor.constraint(equalTo: rightAnchor,constant:  -20).isActive = true
        playerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tableView.topAnchor.constraint(equalTo: playerView.bottomAnchor, constant: 10).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
