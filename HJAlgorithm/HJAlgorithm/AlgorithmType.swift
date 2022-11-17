//
//  AlgorithmType.swift
//  HJAlgorithm
//
//  Created by 夏航军(lu.com) on 2022/11/17.
//

import UIKit

enum AlgorithmType: CaseIterable {
    case test
    
    var description: String {
        switch self {
        case .test:
            return "测试"
        }
    }
    
    var viewController:UIViewController {
        switch self {
        case .test:
            let vc = UIViewController()
            return vc
        }
    }
}
