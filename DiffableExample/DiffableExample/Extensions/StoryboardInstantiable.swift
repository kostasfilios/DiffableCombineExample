//
//  StoryboardInstantiable.swift
//  BlueBrown
//
//  Created by Kostas Filios.
//  Copyright © 2018  BlueBrown. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboardIdetifier: String {get}
    static func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self
}

extension UIViewController {
    fileprivate class func instantiateFromStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, type: T.Type) -> T {
        return storyboard.instantiateViewController(withIdentifier: self.storyboardIdetifier) as! T
    }
}

extension UIViewController: StoryboardInstantiable {
    static var storyboardIdetifier: String { return String(describing: self) }
    
    class func instantiateFromStoryboard(_ storyboard: UIStoryboard) -> Self {
        return instantiateFromStoryboard(storyboard, type: self)
    }
}

