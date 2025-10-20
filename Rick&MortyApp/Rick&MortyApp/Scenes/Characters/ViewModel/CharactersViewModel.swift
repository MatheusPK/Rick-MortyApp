//
//  CharactersViewModel.swift
//  Rick&MortyApp
//
//  Created by André Barros on 20/10/25.
//

protocol CharactersViewModelProtocol {
    func fetchCharacters()
    func didTapFavorite()
    func didChangeSearchTextField()
    func didTapCharacterCell()
    func bind(_ listener: @escaping (CharactersViewState?) -> Void)
}

final class CharactersViewModel: CharactersViewModelProtocol {
    
    var state: Bindable<CharactersViewState?> = .init(nil)
    
    func fetchCharacters() {
        state.value = .loading
        
    }
    
    func didTapFavorite() {
        
    }
    
    func didChangeSearchTextField() {
        
    }
    
    func didTapCharacterCell() {
        
    }
    
    func bind(_ listener: @escaping (CharactersViewState?) -> Void) {
        state.bind(listener)
    }
}
