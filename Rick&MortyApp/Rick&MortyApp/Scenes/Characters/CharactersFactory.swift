//
//  CharactersFactory.swift
//  Rick&MortyApp
//
//  Created by Matheus Pereira Kulick on 20/10/25.
//

import UIKit

enum CharactersFactory: SceneFactory {
    typealias Dependencies = Void?
    
    static func build(with dependencies: Void? = nil) -> UIViewController {
        let requestProvider = RequestProviderImp()
        let viewModel = CharactersViewModel(requestProvider: requestProvider)
        let charactersView = CharactersView()
        let vc = CharactersViewController(viewModel: viewModel, charactersView: charactersView)
        
        vc.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person.fill"), tag: 0)
        return vc
    }
}
