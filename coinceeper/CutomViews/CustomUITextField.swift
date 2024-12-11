//
//  CustomUITextField.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 11.12.2024.
//

import Foundation
import UIKit

class CustomUITextField: UIView {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldMainStackView: UIStackView!
    @IBOutlet weak var textRightImageView: UIImageView!
    @IBOutlet weak var textMiddleImageView: UIImageView!
    @IBOutlet weak var textBottomInfoLabel: UILabel! // TODO: will asign dont forget
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    
    var textPlaceHolderColor: UIColor = .black {
        didSet {
            self.textField.attributedPlaceholder = NSAttributedString(
                string: "",
                attributes: [NSAttributedString.Key.foregroundColor: self.textPlaceHolderColor]
            )
        }
    }
    
    var textPlaceHolder: String = "" {
        didSet {
            self.textField.placeholder = self.textPlaceHolder
        }
    }
    
    var cornerRadius: CGFloat = 10 {
        didSet {
            self.textFieldMainStackView.layer.cornerRadius = self.cornerRadius
        }
    }
    
    var borderColor: UIColor = .black {
        didSet {
            self.textFieldMainStackView.layer.borderColor = borderColor.cgColor
        }
    }
    
    var textRightImage: UIImage = UIImage() {
        didSet {
            self.textRightImageView.image = self.textRightImage
        }
    }
    
    var textMiddleImage: UIImage = UIImage() {
        didSet {
            self.textRightImageView.image = self.textMiddleImage
        }
    }
    
    var textTitle: String = "" {
        didSet {
            self.textField.text = self.textTitle
        }
    }
    
    var bottomLabelText: String = "" {
        didSet {
            self.textBottomInfoLabel.text = self.bottomLabelText
        }
    }

    
    func setup() {
        self.commonInit()
        self.textFieldMainStackView.layer.borderColor = borderColor.cgColor
        self.textFieldMainStackView.layer.borderWidth = 1
        self.textField.text = self.textTitle
        self.textFieldMainStackView.layer.cornerRadius = self.cornerRadius
    }
    
    func commonInit() {
        let view = Bundle.main.loadNibNamed("CustomUITextField", owner: self, options: nil)?.first as! UIView
        self.translatesAutoresizingMaskIntoConstraints = false
        view.frame = self.bounds
        self.addSubview(view)
    }
}


