//
//  MainViewController.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit


class MainViewController: UIViewController {
    
    private lazy var stepsTapButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Steps", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.backgroundColor = #colorLiteral(red: 0.219912678, green: 0.3977074623, blue: 0.5105017424, alpha: 1)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(stepsButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nextTapButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("Text", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.backgroundColor = #colorLiteral(red: 0.219912678, green: 0.3977074623, blue: 0.5105017424, alpha: 1)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(textButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        
        view.backgroundColor = .systemGray6
        view.addSubview(stepsTapButton)
        view.addSubview(nextTapButton)
        
    }
    
    @objc private func stepsButtonAction() {
        
        
    }
    
    @objc private func textButtonAction() {
        
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            stepsTapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stepsTapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stepsTapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            stepsTapButton.heightAnchor.constraint(equalToConstant: 60),
            
            nextTapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nextTapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nextTapButton.topAnchor.constraint(equalTo: stepsTapButton.bottomAnchor, constant: 40),
            nextTapButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
}



