//
//  TabBarFactory.swift
//  Rick&MortyApp
//
//  Created by Matheus Pereira Kulick on 20/10/25.
//

import UIKit

enum TabBarFactory: SceneFactory {
    typealias Dependencies = Void?
    
    static func build(with dependencies: Void? = nil) -> UIViewController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.isTranslucent = false
        
        let characterVC = CharacterFactory.build()
        
        let episodesVC = UIViewController()
        episodesVC.view.backgroundColor = .blue
        episodesVC.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "movieclapper.fill"), tag: 1)
        
        let locationsVC = UIViewController()
        locationsVC.view.backgroundColor = .yellow
        locationsVC.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe.americas.fill"), tag: 2)
        
        let favoritesVC = UIViewController()
        favoritesVC.view.backgroundColor = .green
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 3)
        
        tabBarController.viewControllers = [
            characterVC,
            episodesVC,
            locationsVC,
            favoritesVC
        ]
        
        tabBarController.selectedViewController = characterVC
        
        return tabBarController
    }
}
