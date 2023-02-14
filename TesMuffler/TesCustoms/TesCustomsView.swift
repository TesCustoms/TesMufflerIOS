/*
 __authors__    = ["Hollis Kwan"]
 __date__       = 2023/02/14
 __deprecated__ = False
 __doc__        = TesCustoms View setup
 __email__      = "holliskwan.ios@gmail.com"
 __license__    = "MIT"
 __status__     = "Development"
 */

import Foundation
import UIKit

class TesCustomsView: UIView {
    
    let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let brandTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "TesCustoms"
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        title.textAlignment = .center
        return title
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
        addSubview(brandTitle)
        
        brandImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        brandImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        brandImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        brandImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        brandTitle.topAnchor.constraint(equalTo: brandImageView.bottomAnchor, constant: 5).isActive = true
        brandTitle.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        brandTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        brandTitle.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
