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
    @IBOutlet weak var passCodeMainView: UIView!
    
    static let identifier: String = "PassCodeCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        passcodeButton.isHidden = true
        
        self.passCodeMainView.layer.cornerRadius = 40
    }
    
    func configure(_ index: Int, passcodeModel: PasscodeModel?) {
       
        guard let passcodeModel, index > 8, index != 10  else {
            return  self.passCodeLabel.text = String(passcodeModel?.number ?? 0)
        }
        
        DispatchQueue.main.async {
            self.passcodeButton.setImage(UIImage(named: "\(passcodeModel.imageName ?? "")"), for: .normal)
        }
        self.passCodeLabel.isHidden = true
        self.passcodeButton.isHidden = false
    }
    
    static func nib() -> UINib {
        return UINib(nibName: PassCodeCollectionViewCell.identifier, bundle: nil)
    }
}
