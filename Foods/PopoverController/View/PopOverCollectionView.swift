//
//  PopOverCollectionView.swift
//  Foods
//
//  Created by Saidaxmad on 20/09/22.
//

import UIKit

protocol PopOverCollectionProtocol: AnyObject {
    func selectItem(indexPath: IndexPath)
}

class PopOverCollectionView: UICollectionView {
    
    weak var mainCellDelegate: PopOverCollectionProtocol?
    private var flowLayout = UICollectionViewFlowLayout()
    
    private let cellConfigureArray = [["Like", "Subscrime", "Contacts" ], ["person", "person", "person"]]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        delegate = self
        dataSource = self
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        register(PopOverCollectionCell.self, forCellWithReuseIdentifier: PopOverCollectionCell().popOverCellId)
        flowLayout.minimumLineSpacing = 2
    }
    
}

extension PopOverCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellConfigureArray[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopOverCollectionCell().popOverCellId, for: indexPath) as? PopOverCollectionCell else { return UICollectionViewCell() }
        
        let iconName = cellConfigureArray[1][indexPath.row]
        let text = cellConfigureArray[0][indexPath.row]
        cell.configureCell(iconName: iconName, text: text)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainCellDelegate?.selectItem(indexPath: indexPath)
        
        switch cellConfigureArray[0][indexPath.row] {
        case "Like": print("fffff")
        case "Subscrime": print("gog")
        case "Contacts": print("deeeee")
        default: break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
    
}
