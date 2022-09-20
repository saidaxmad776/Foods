//
//  StepViewController.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

class StepViewController: UIViewController {
    
    private let swiftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "Picture")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "e"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var startValue = 0
    private let endValue = 500
    private let duration = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        createDisplayLink()
    }
    
    private func setupView() {
        
        view.backgroundColor = .systemGray6
        view.addSubview(swiftImageView)
        view.addSubview(nameLabel)
        
    }
    
    private func createDisplayLink() {
        let displayLink = CADisplayLink(target: self, selector: #selector(step))
        displayLink.add(to: .current, forMode: .default)
        displayLink.preferredFramesPerSecond = 60
    }
    
    @objc private func step(displayLink: CADisplayLink) {
        
        startValue += duration
        nameLabel.text = "Steps today: \(startValue)"
        
        if startValue > endValue {
            displayLink.invalidate()
            nameLabel.text = "Steps today: \(endValue)"
        }
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            swiftImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            swiftImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            swiftImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            swiftImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameLabel.topAnchor.constraint(equalTo: swiftImageView.bottomAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
