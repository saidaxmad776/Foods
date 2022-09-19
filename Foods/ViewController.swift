//
//  ViewController.swift
//  Foods
//
//  Created by Saidaxmad on 16/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let collection: UICollectionView = {
       let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.register(SaleCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCollectionViewCell")
        collectionView.register(ExampleCollectionViewCell.self, forCellWithReuseIdentifier: "ComingSoonCollectionViewCel")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let orderButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Make to order", for: .normal)
        btn.backgroundColor = .darkGray
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let sections = MockData.shared.pageData

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setDelegate()
    }

    private func setupView() {
        
        view.backgroundColor = .systemGray5
        
        view.addSubview(orderButton)
        view.addSubview(collection)
    }
    
    private func setDelegate() {
        collection.delegate = self
        collection.dataSource = self
    }
}

extension ViewController {
    
//    private func createLayout() -> UICollectionViewCompositionalLayout {
//
//        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
//            guard let self = self else { return nil }
//            let section = self.sections[sectionIndex]
//            switch section {
//            case .sales(_):
//                <#code#>
//            case .category(_):
//                <#code#>
//            case .example(_):
//                <#code#>
//            }
//        }
//    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat, supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsets: Bool) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
    }
    
    private func createSaleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        
        let section = createLayoutSection(group: group, behavior: .groupPaging, interGroupSpacing: 5, supplementaryItems: [], contentInsets: false)
        section.contentInsets = .init(top: 0, leading: -10, bottom: 0, trailing: 0)
        
        return section
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .sales(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? SaleCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(imageName: sale[indexPath.row].image)
            return cell
        case .category(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)
            return cell
            
        case .example(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingSoonCollectionViewCel", for: indexPath) as? ExampleCollectionViewCell else { return UICollectionViewCell() }
            cell.configureCell(imageName: example[indexPath.row].image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as!HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.row].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

extension ViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
        
            orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            orderButton.heightAnchor.constraint(equalToConstant: 50),
            
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -10),
        ])
    }
}
