//
//  ExtensionNSObject.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 21/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation

protocol Identifying { }

extension Identifying where Self : NSObject {
    static var identifier: String { return String(describing: self) }
    
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
}

extension NSObject: Identifying { }
