//
//  InitialCoordinator.swift
//  SkeletonIOSApp
//
//  Created by Vukasin on 05/08/2020.
//  Copyright © 2020 swiftylabs. All rights reserved.
//

import UIKit
import Coordinator

final class InitialCoordinator: NavigationCoordinator {
	
	// MARK: - Properties
	
	enum Screen {
		case initial
	}
	
	var screen: Screen = .initial
	
	// MARK: - NavigationCoordinator
	
	override func start(with completion: @escaping () -> Void) {
		super.start(with: {[weak self] in
			guard let wSelf = self else {return}
			wSelf.displayScreen(wSelf.screen)
		})
	}
	
	// MARK: - Private methods
	
	private func displayScreen(_ screen: Screen) {
		switch screen {
		case .initial:
			displayViewController()
		}
	}
	
	private func displayViewController() {
		let controller = InitialViewController()
		root(controller)
	}
}

