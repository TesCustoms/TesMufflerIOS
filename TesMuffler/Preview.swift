//
//  Preview.swift
//  TesMuffler
//
//  Created by Hollis Kwan on 2/27/23.
//

import Foundation
import SwiftUI


extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginScreenViewController
    
    func updateUIViewController(_ uiViewController: LoginScreenViewController, context: Context) {}
    
    func makeUIViewController(context: Context) -> LoginScreenViewController {
        return LoginScreenViewController()
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .ignoresSafeArea(.all)
    }
}

