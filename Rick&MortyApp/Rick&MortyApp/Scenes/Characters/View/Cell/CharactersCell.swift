//
//  CharactersCell.swift
//  Rick&MortyApp
//
//  Created by André Barros on 03/11/25.
//
import UIKit

final class CharactersCell: UITableViewCell {
    
    private lazy var charactersStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [poster,nameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var poster: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .black
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(character: Character) {
        nameLabel.text = character.name
        if let url = URLComponents(string: character.image ?? "") {
            poster.setImage(request: CharactersRequest.characterImage(url: url))
        }
    }
}

extension CharactersCell: ViewCode {
    func buildViewHierarchy() {
        contentView.addSubview(charactersStackView)
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            charactersStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            charactersStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            charactersStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            charactersStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            poster.heightAnchor.constraint(equalTo: poster.widthAnchor, multiplier: 1.25),
        ])
    }
    
    func setupAdditionalConfiguration() {
    }
}
