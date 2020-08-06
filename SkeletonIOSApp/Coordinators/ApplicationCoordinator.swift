//
//  ApplicationCoordinator.swift
//  SkeletonIOSApp
//
//  Created by Vukasin on 05/08/2020.
//  Copyright © 2020 swiftylabs. All rights reserved.
//

import UIKit
import Coordinator


final class ApplicationCoordinator: NavigationCoordinator {
	
	// MARK: - Properties
	
	var coordinatorType: CoordinatorType = .initial(.initial)
	var appWindow: UIWindow
	
	// MARK: - Initialization
	
	init(window: UIWindow, rootViewController: UINavigationController?) {
		self.appWindow = window
		super.init(rootViewController: rootViewController)
	}
	
	// MARK: - NavigationCoordinator
	
	override func start(with completion: @escaping () -> Void) {
		super.start {[weak self] in
			guard let wSelf = self else { return }
			if case .initial(let screen) = wSelf.coordinatorType {
				wSelf.displayInitialCoordinator(for: screen)
			}
		}
	}
	
	// MARK: - Private methods
	
	private func displayInitialCoordinator(for screen: InitialCoordinator.Screen) {
		let coordinator = InitialCoordinator(rootViewController: rootViewController)
		coordinator.screen = screen
		startChild(coordinator: coordinator)
		setRoot(coordinator.rootViewController, on: appWindow)
	}
	
	private func setRoot(_ controller: UIViewController, on window: UIWindow) {
		if window.rootViewController != controller {
			window.rootViewController = controller
			window.makeKeyAndVisible()
		}
	}
}

