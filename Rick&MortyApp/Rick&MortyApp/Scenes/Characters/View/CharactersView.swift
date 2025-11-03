//
//  CharactersView.swift
//  Rick&MortyApp
//
//  Created by André Barros on 03/11/25.
//

import UIKit

final class CharactersView: UIView {
    
    var characters: [Character] = []
    
    lazy var loadingView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicatorView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharactersCell.self, forCellReuseIdentifier: "CharactersCell")
        return tableView
    }()
    
    var currentView: UIView? {
        didSet {
            oldValue?.isHidden = true
            currentView?.isHidden = false
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateState(to state: CharactersViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch state {
            case .loading:
                currentView = loadingView
                loadingView.startAnimating()
            case .charactersList(let charactersResponse):
                loadingView.stopAnimating()
                characters = charactersResponse.results ?? []
                currentView = tableView
                tableView.reloadData()
            case .error:
                loadingView.stopAnimating()
            }
        }
    }
}

extension CharactersView: ViewCode {
    func buildViewHierarchy() {
        addSubview(tableView)
        addSubview(loadingView)
        
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
    }
}

extension CharactersView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharactersCell") as? CharactersCell
        else { return UITableViewCell() }
        
        cell.configure(character: characters[indexPath.row])
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
