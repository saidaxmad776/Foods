//
//  ContextMenuVC.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

class ContextMenuVC: UIViewController {
    
    private let burgerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.image = UIImage(named: "image")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let listAction = ["Instagram", "Telegram", "LinkeDin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        requestContextMenu()
    }
    
    private func setupView() {
        
        view.backgroundColor = .systemGray5
        view.addSubview(burgerImageView)
        
    }
    
    private func requestContextMenu() {
        
        let contextMenu = UIContextMenuInteraction(delegate: self)
        burgerImageView.isUserInteractionEnabled = true
        burgerImageView.addInteraction(contextMenu)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            burgerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            burgerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            burgerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            burgerImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
        ])
    }
}

extension ContextMenuVC: UIContextMenuInteractionDelegate {
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            
            let like = UIAction(title: "Like", image: UIImage(systemName: "person")) { _ in
                print("like")
            }
            
            let subscrime = UIAction(title: "subscrime", image: UIImage(systemName: "person")) { _ in
                print("subscrime")
            }
            
            let contact = UIAction(title: "contact", image: UIImage(systemName: "person")) { _ in
                print("contact")
            }
            
            let delete = UIAction(title: "delete", image: UIImage(systemName: "person"), attributes: .destructive) { _ in
                print("delete")
            }
            
            let listAction = self.listAction.map {
                UIAction(title: "Call to \($0)") { _ in
                    print("Call")
                }
            }
            
            let contactMenu = UIMenu(title: "Contact", children: listAction)
            
            return UIMenu(title: "Contect Menu", children: [like, subscrime, contactMenu, delete])
        }
    }
    
}
