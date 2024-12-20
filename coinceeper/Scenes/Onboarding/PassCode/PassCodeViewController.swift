//
//  PassCodeViewController.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 11.12.2024.
//

import UIKit

class PassCodeViewController: UIViewController, Storyboarded {
    @IBOutlet weak var passCodeCollectionView: UICollectionView!
    @IBOutlet weak var passCodeCircleCollectionView: UICollectionView!
    
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
        
        self.passCodeViewModel?.passCodeViewModelDelegate = self
        
        self.passCodeCollectionView.register(PassCodeCollectionViewCell.nib(), forCellWithReuseIdentifier: PassCodeCollectionViewCell.identifier)
        self.passCodeCircleCollectionView.register(PassCodeCircleCollectionViewCell.nib(), forCellWithReuseIdentifier: PassCodeCircleCollectionViewCell.identifier)
        
        self.passCodeViewModel?.createPackCodeModelList()
        
        //collectionView register
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        self.passCodeCollectionView.collectionViewLayout = layout
    }
}

extension PassCodeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 6
        }else if collectionView.tag == 1 {
            return self.passCodeViewModel?.passCodeModelList.count ?? 1
        }else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PassCodeCircleCollectionViewCell.identifier, for: indexPath) as? PassCodeCircleCollectionViewCell {
                
                return cell
            }
        } else if collectionView.tag == 1 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PassCodeCollectionViewCell.identifier, for: indexPath) as? PassCodeCollectionViewCell {
                
                cell.configure(indexPath.row, passcodeModel: self.passCodeViewModel?.passCodeModelList[indexPath.row])
                return cell
            }
        }
       
        return UICollectionViewCell()
    }
    
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }*/
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 20, bottom: 10, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension PassCodeViewController: PassCodeViewModelDelegate {
    func createPascodeModelListDidUpdate() {
        self.passCodeCollectionView.reloadData()
    }
}
