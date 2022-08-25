//
//  AppCoordinator.swift
//  Quotes
//
//  Created by Bart Jacobs on 02/06/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    // MARK: - Public API
    
    var rootViewController: UIViewController {
        return navigationController
    }

    // MARK: -
    
    func start() {
        showQuotes()
    }
    
    // MARK: - Helper Methods
    
    private func showQuotes() {
        // Initialize Quotes View Controller
        guard let quotesViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "QuotesViewController") as? QuotesViewController else {
            fatalError("Unable to Instantiate Quotes View Controller")
        }
        
        // Push Quotes View Controller Onto Navigation Stack
        navigationController.pushViewController(quotesViewController, animated: true)
    }
    
}
