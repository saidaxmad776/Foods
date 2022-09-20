//
//  ContextMenuVC.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

class ContextMenuVC: UIViewController {
    
    private let saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "image")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        
    }
    
    private func setConstraints() {
        
    }
}
