//
//  CharactersViewController.swift
//  Rick&MortyApp
//
//  Created by Matheus Pereira Kulick on 20/10/25.
//

import UIKit

class CharactersViewController: UIViewController {
    
    let viewModel: CharactersViewModelProtocol
    
    init(viewModel: CharactersViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.bind { [weak self] state in
            self?.didUpdateState(state)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCharacters()
    }
    
    private func didUpdateState(_ state: CharactersViewState?) {
        switch state {
        case .loading:
            print("Carregando")
        case .charactersList:
            print("Ok")
        case .error:
            print("Error")
        default: break
        }
    }
}
