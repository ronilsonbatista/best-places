//
//  Connectivity.swift
//  BestPlaces
//
//  Created by Ronilson Batista on 20/04/19.
//  Copyright © 2019 Ronilson Batista. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
