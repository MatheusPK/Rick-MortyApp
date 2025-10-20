//
//  SceneFactory.swift
//  Rick&MortyApp
//
//  Created by Matheus Pereira Kulick on 20/10/25.
//

import UIKit

protocol SceneFactory {
    associatedtype Dependencies
    static func build(with dependencies: Dependencies) -> UIViewController
}
