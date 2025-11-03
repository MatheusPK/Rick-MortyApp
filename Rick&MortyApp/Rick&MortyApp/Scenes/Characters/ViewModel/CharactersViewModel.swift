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
    
    // MARK: Dependecies
    let requestProvider: RequestProvider
    
    init(requestProvider: RequestProvider) {
        self.requestProvider = requestProvider
    }
    
    func fetchCharacters() {
        state.value = .loading
        makeCharactersRequest()
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

extension CharactersViewModel {
    private func makeCharactersRequest() {
        requestProvider.make(request: CharactersRequest.characters(page: 0)) { (result: (Result<CharactersResponse?, RequestError>)) in
            switch result {
            case .success(let charactersResponse):
                guard let charactersResponse else {
                    self.state.value = .error
                    return
                }
                
                self.state.value = .charactersList(charactersResponse: charactersResponse)
    
            case .failure:
                self.state.value = .error
            }
        }
    }
}
