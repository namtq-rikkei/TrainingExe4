//
//  Common.swift
//  TrainingExe4
//
//  Created by NamTQ-D3 on 5/29/19.
//  Copyright © 2019 NamTQ-D3. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setText(text: String) {
        self.setTitle(text, for: .normal)
        self.setTitle(text, for: .disabled)
        self.setTitle(text, for: .selected)
    }
}
