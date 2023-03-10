/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/23
 __deprecated__ = False
 __doc__        = Profile custom cell setup for user data
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class CustomInfoCell: UITableViewCell {
    
    static let identifier: String = {
        return String(describing: CustomInfoCell.self)
    }()
    
    let xButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.tintColor = .systemGray
        button.isHidden = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        detailTextLabel?.font = UIFont.systemFont(ofSize: 25)
        textLabel?.textColor = .systemGray
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        contentView.addSubview(xButton)
        
        xButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        xButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        xButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        xButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setDetailText(with text: String) {
        detailTextLabel?.text = text
    }
    
    func setLabelText(with text: String) {
        textLabel?.text = text
    }
    
    func pencilTappedTrueCellConfig() {
        backgroundColor = .systemBlue.withAlphaComponent(0.3)
        xButton.isHidden = false
    }
    
    func pencilTappedFalseCellConfig() {
        backgroundColor = .white
        xButton.isHidden = true
    }
    
}
