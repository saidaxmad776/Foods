//
//  PopoverController.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

class PopoverController: UIViewController {
    
    private let swiftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "swiftt")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let nameLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Category"
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textColor = .black
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private lazy var tapButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("?", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(tapButtonAction), for: .touchUpInside)
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
        view.addSubview(swiftImageView)
        view.addSubview(tapButton)
        
    }
    
    @objc private func tapButtonAction() {
        
        if view.alpha == 1 {
            view.alpha = 0.5
        } else {
            view.alpha = 1
        }
        
        let popoverViewController = PopoverView()
        popoverViewController.modalPresentationStyle = .popover
        popoverViewController.preferredContentSize = CGSize(width: 130, height: 150)
        
        guard let presetionVc = popoverViewController.popoverPresentationController else { return }
        presetionVc.delegate = self
        presetionVc.sourceView = tapButton
        presetionVc.permittedArrowDirections = .down
        presetionVc.sourceRect = CGRect(x: tapButton.bounds.midX, y: tapButton.bounds.maxY - 45, width: 0, height: 0)
        
        presetionVc.passthroughViews = [tapButton]
        
        if tapButton.titleLabel?.text == "?" {
            tapButton.setTitle("X", for: .normal)
            present(popoverViewController, animated: true)
        } else {
            tapButton.setTitle("?", for: .normal)
            presentedViewController?.dismiss(animated: true)
        }
            
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            swiftImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            swiftImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            swiftImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            swiftImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            
            tapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tapButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            tapButton.heightAnchor.constraint(equalToConstant: 50),
            tapButton.widthAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}

extension PopoverController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        false
    }
}

