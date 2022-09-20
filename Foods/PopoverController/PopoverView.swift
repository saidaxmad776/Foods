//
//  PopoverView.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

class PopoverView: UIViewController {
    
    private let popOverCollectionView = PopOverCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(popOverCollectionView)
    }
    
}

extension PopoverView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            
        ])
    }
}
