//
//  CustomCircleView.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 11.12.2024.
//

import Foundation
import UIKit

class CustomCircleView: UIView {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var insideView: UIView!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    var borderColor: UIColor = .blue {
        didSet {
            self.mainView.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    var borderWidth: CGFloat = 1 {
        didSet {
            self.mainView.layer.borderWidth = self.borderWidth
        }
    }
    
    var insideViewColor: UIColor = .black {
        didSet {
            self.insideView.backgroundColor = self.insideViewColor
        }
    }
    
    func setup () {
        self.customInit()
        
        self.mainView.layer.borderColor = self.borderColor.cgColor
        self.mainView.layer.borderWidth = self.borderWidth
        self.insideView.backgroundColor = self.insideViewColor
        
        self.mainView.layer.cornerRadius = self.bounds.width / 2
        self.insideView.layer.cornerRadius = self.bounds.width / 2
    }
    
    func customInit () {
        let view = Bundle.main.loadNibNamed("CustomCircleView", owner: self, options: nil)?.first as! UIView
        self.translatesAutoresizingMaskIntoConstraints = false
        view.frame = self.bounds
        self.addSubview(view)
    }
}
