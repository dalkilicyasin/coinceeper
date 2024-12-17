//
//  PassCodeCollectionViewCell.swift
//  coinceeper
//
//  Created by Yasin Dalkilic on 17.12.2024.
//

import UIKit

class PassCodeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var passCodeLabel: UILabel!
    @IBOutlet weak var passcodeButton: UIButton!
    
    static let identifier: String = "PassCodeCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        passcodeButton.isHidden = true
    }
    
    func configure(with index: Int, passcodeModel: PasscodeModel?) {
        self.passCodeLabel.text = String(index)
        if let passcodeModel, index > 8 {
            DispatchQueue.main.async {
                self.passcodeButton.setImage(UIImage(named: "\(passcodeModel.imageName ?? "")"), for: .normal)
            }
            self.passCodeLabel.isHidden = true
            self.passcodeButton.isHidden = false
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: PassCodeCollectionViewCell.identifier, bundle: nil)
    }
}
