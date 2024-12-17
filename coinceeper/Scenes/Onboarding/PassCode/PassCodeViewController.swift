//
//  PassCodeViewController.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 11.12.2024.
//

import UIKit

class PassCodeViewController: UIViewController, Storyboarded {
    @IBOutlet weak var passCodeCollectionView: UICollectionView!
    @IBOutlet weak var passCodeTableView: UITableView!
    
    var passCodeViewModel: PassCodeViewModel?
    var coordinator: PassCodeCoordinator?
    
    init(passCodeViewModel: PassCodeViewModel? = nil) {
        self.passCodeViewModel = passCodeViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.passCodeViewModel = PassCodeViewModel()
        super.init(coder: coder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.passCodeCollectionView.register(PassCodeCollectionViewCell.nib(), forCellWithReuseIdentifier: PassCodeCollectionViewCell.identifier)
    }

}
