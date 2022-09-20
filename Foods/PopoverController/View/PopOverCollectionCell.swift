//
//  PopOverCollectionCell.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

class PopOverCollectionCell: UICollectionViewCell {
    
   public let popOverCellId = "popOverCellId"
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .cyan
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
          let label = UILabel()
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = .white
        addSubview(logoImageView)
        addSubview(nameLabel)
    }
    
    func configureCell(iconName: String, text: String) {
        logoImageView.image = UIImage(systemName: iconName)
        nameLabel.text = text
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 20),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }
}
