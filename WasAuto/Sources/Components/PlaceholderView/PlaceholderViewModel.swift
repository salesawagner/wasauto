//
//  PlaceholderView.swift
//  WasAuto
//
//  Created by Wagner Sales on 23/10/18.
//  Copyright © 2018 Wagner Sales. All rights reserved.
//

import UIKit

class PlaceholderViewModel: NSObject {

    // MARK: - Properties

    var image: UIImage?
    var title: String?
    var message: String

    // MARK: - Constructors

    init(image: UIImage?, title: String?, message: String) {
        self.image = image
        self.title = title
        self.message = message
    }
}
