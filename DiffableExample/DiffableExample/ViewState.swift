//
//  ViewState.swift
//  Novibet
//
//  Created by Efthimis Liapatis on 18/09/2018.
//  Copyright © 2018 Novibet. All rights reserved.
//

import Foundation

enum ViewState<T> {
    case loading
    case loaded(T)
    case error(Error)
}
