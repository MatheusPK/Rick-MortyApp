//
//  CharactersViewController.swift
//  Rick&MortyApp
//
//  Created by Matheus Pereira Kulick on 20/10/25.
//

import UIKit

class CharactersViewController: UIViewController {
    
    let viewModel: CharactersViewModelProtocol
    let charactersView: CharactersView
    
    init(viewModel: CharactersViewModelProtocol, charactersView: CharactersView) {
        self.viewModel = viewModel
        self.charactersView = charactersView
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.bind { [weak self] state in
            self?.didUpdateState(state)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = charactersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCharacters()
    }
    
    private func didUpdateState(_ state: CharactersViewState?) {
        guard let state else { return }
        switch state {
        case .loading:
            charactersView.updateState(to: state)
            print("Carregando")
        case .charactersList:
            charactersView.updateState(to: state)
            print("Carregou")
        case .error:
            print("Error")
        }
    }
}
