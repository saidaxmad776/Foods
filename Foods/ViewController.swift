//
//  ViewController.swift
//  Foods
//
//  Created by Saidaxmad on 16/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let orderButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Make to order", for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }

    private func setupView() {
        
    }
}

extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            
        ])
    }
}
