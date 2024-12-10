//
//  CustomButton.swift
//  mywork
//
//  Created by Yasin Dalkilic on 27.11.2024.
//

import Foundation
import UIKit
import SnapKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    var color: UIColor = .systemGreen {
        didSet {
            self.backgroundColor = color
        }
    }
    
    var cornerRadius: CGFloat = 16 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    var borderWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    var titleColor: UIColor = .white {
        didSet {
            setTitleColor(self.titleColor, for: .normal)
        }
    }
    
    var title: String = "" {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    func setup() {
        self.backgroundColor = self.color
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(self.titleColor, for: .normal)
    }
}
