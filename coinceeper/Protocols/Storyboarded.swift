//
//  Storyboarded.swift
//  coinceeper
//
//  Created by yasin on 15.09.2024.
//

import Foundation
import UIKit

protocol Storyboarded {
    
}

extension Storyboarded where Self : UIViewController {
    static func instantiate(name: StoryboardNames) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name.rawValue, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
