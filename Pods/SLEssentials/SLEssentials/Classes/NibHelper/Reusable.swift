//
//  Reusable.swift
//  SLEssentials
//
//  Created by Mirko on 1/3/18.
//  Copyright © 2018 SwiftyLabs. All rights reserved.
//

import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable where Self: UIView {
	public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
