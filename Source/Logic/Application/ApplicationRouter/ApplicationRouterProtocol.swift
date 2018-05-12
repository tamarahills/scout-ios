//
//  ApplicationRouterProtocol.swift
//  Scout
//
//

import UIKit

protocol ApplicationRouterProtocol: UIApplicationDelegate {
    
    var applicationAssembly: ApplicationAssemblyProtocol { get }
    
    func show(from window: UIWindow)
}