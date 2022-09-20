//
//  TextAnimateViewController.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit
import AVFoundation

class TextAnimateViewController: UIViewController {
    
    private let swiftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "ramka")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textString = "Hello My name is Saidaxmad "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        addGesture()
    }
    
    private func setupView() {
        
        view.backgroundColor = .systemGray5
        view.addSubview(swiftImageView)
        swiftImageView.addSubview(nameLabel)
        
    }
    
    private func addGesture() {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(typingTest))
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func typingTest() {
        
        guard var text = nameLabel.text else { return }
        
        for char in textString {
            AudioServicesPlaySystemSound(1306)
            text += "\(char)"
            nameLabel.text = text
            RunLoop.current.run(until: Date() + 0.15)
        }
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            swiftImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            swiftImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            swiftImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            swiftImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            nameLabel.topAnchor.constraint(equalTo: swiftImageView.topAnchor, constant: 225),
            nameLabel.leadingAnchor.constraint(equalTo: swiftImageView.leadingAnchor, constant: 70),
            nameLabel.widthAnchor.constraint(equalToConstant: 275)
            
        ])
    }
}
