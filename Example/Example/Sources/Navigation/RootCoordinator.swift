//
//  RootCoordinator.swift
//  RandomUIKitExample
//
//  Created by Vitalii Sosin on 01.05.2022.
//

import UIKit
import FancyStyle

final class RootCoordinator: Coordinator {
  
  // MARK: - Private variables
  
  private let window: UIWindow
  private let navigationController = UINavigationController()
  private var mainScreenCoordinator: Coordinator?
  
  // MARK: - Initialization
  
  /// - Parameter window: UIWindow
  init(window: UIWindow) {
    self.window = window
  }
  
  // MARK: - Internal func
  
  func start() {
    let mainScreenCoordinator: Coordinator = MainScreenCoordinator(
      navigationController
    )
    self.mainScreenCoordinator = mainScreenCoordinator
    mainScreenCoordinator.start()
    
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = fancyColor.darkAndLightTheme.primaryWhite
    appearance.titleTextAttributes = [.foregroundColor: fancyColor.darkAndLightTheme.primaryBlack]
    appearance.largeTitleTextAttributes = [.foregroundColor: fancyColor.darkAndLightTheme.primaryBlack]
    
    navigationController.navigationBar.tintColor = fancyColor.darkAndLightTheme.primaryBlack
    navigationController.navigationBar.standardAppearance = appearance
    navigationController.navigationBar.compactAppearance = appearance
    navigationController.navigationBar.scrollEdgeAppearance = appearance
    
    window.makeKeyAndVisible()
    window.rootViewController = navigationController
  }
}
