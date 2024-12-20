//
//  PassCodeCircleCollectionViewCell.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 19.12.2024.
//

import UIKit

class PassCodeCircleCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var customCircleView: CustomCircleView!
    static let identifier: String = "PassCodeCircleCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        UINib(nibName: self.identifier, bundle: nil)
    }

}
