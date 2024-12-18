//
//  PassCodeViewModel.swift
//  coinceeper
//
//  Created by Yasin Dalkılıç on 11.12.2024.
//

import Foundation

protocol PassCodeViewModelDelegate: AnyObject {
    func createPascodeModelListDidUpdate()
}

class PassCodeViewModel {
    
    var passCodeModelList: [PasscodeModel] = []
    
    weak var passCodeViewModelDelegate: PassCodeViewModelDelegate?
    
    func createPackCodeModelList() {
        var number = 0
        var passCodeModel = PasscodeModel()
        for i in 0..<12 {
            switch i {
            case 0..<9 :
                number += 1
                passCodeModel.number = number
                self.passCodeModelList.append(passCodeModel)
               
            case 9 :
                passCodeModel.imageName = "icon-fingerprint"
                self.passCodeModelList.append(passCodeModel)
            case 10 :
                passCodeModel.number = 0
                self.passCodeModelList.append(passCodeModel)
            case 11 :
                passCodeModel.imageName = "delete-left-icon"
                self.passCodeModelList.append(passCodeModel)
            default :
                break
            }
        }
        if self.passCodeModelList.count > 0 {
            self.passCodeViewModelDelegate?.createPascodeModelListDidUpdate()
        }
    }
}
