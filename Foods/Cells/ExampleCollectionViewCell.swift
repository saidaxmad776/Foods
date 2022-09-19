//
//  ExampleCollectionViewCell.swift
//  Foods
//
//  Created by Saidaxmad on 16/09/22.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
    
    private let burgerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let backgroundTitleView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "Egg Top Burger"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Arial", size: 16)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let priceLabel: UILabel = {
       let lbl = UILabel()
        lbl.text = "$7.42"
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Arial Bold", size: 24)
        lbl.textColor = .red
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview(burgerImageView)
        addSubview(backgroundTitleView)
        addSubview(nameLabel)
        addSubview(priceLabel)
    }
    
    func configureCell(imageName: String) {
        burgerImageView.image = UIImage(named: imageName)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            burgerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            burgerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            burgerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -10),
        ])
    }
    
}
