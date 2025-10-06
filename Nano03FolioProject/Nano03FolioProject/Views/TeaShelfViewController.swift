//
//  TeaShelfViewController.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 04/10/25.
//

import Foundation
import UIKit

class TeaShelfViewController: UIViewController {
    private let collection: TeaCollection
    private var teas: [Tea] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .systemBackground
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(180)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    

    private func setupFakeTeas() {
        teas = [
            Tea(
                name: "Earl Grey",
                type: .teaBag,
                variant: 1,
                details: .store(flavor: "Earl Grey", brand: "Lipton"),
                collectionId: collection.id
            ),
            Tea(
                name: "Chá Verde",
                type: .teaCup,
                variant: 2,
                details: .homemade(ingredients: ["Folhas de chá verde"]),
                collectionId: collection.id
            ),
            Tea(
                name: "Camomila",
                type: .teaBag,
                variant: 3,
                details: .store(flavor: "Camomila", brand: "Leão"),
                collectionId: collection.id
            ),
            Tea(
                name: "Hortelã",
                type: .teaCup,
                variant: 4,
                details: .homemade(ingredients: ["Hortelã fresca", "limão"]),
                collectionId: collection.id
            )
        ]
        
        collectionView.reloadData()
    }
    
    init(collection: TeaCollection) {
        self.collection = collection
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = collection.name
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        collectionView.register(TeaCell.self, forCellWithReuseIdentifier: TeaCell.identifier)

        setupFakeTeas()
    }
}

extension TeaShelfViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TeaCell.identifier,
            for: indexPath
        ) as? TeaCell else {
            return UICollectionViewCell()
        }
        
        let tea = teas[indexPath.item]
        cell.configure(with: tea)
        
        return cell
    }
}

extension TeaShelfViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tea = teas[indexPath.item]
        print("Tocou no chá: \(tea.name)")
        print("Tipo do chá: \(tea.type)")
        
        // TODO: Navegar para a tela de detalhes do chá
    }
}
