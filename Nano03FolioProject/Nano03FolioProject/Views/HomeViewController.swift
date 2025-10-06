//
//  HomeViewController.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 01/10/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private var collections: [TeaCollection] = []
    private let fab = FloatingActionButton()
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Minha estante"
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        setupFakeData()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        fab.addToView(view)

        fab.addTarget(self, action: #selector(fabTapped), for: .touchUpInside)
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    private func setupFakeData() {
        collections = [
            TeaCollection(name: "Chás da Manhã", boxColor: 1),
            TeaCollection(name: "Chás Relaxantes", boxColor: 2),
            TeaCollection(name: "Chás Verdes", boxColor: 3),
            TeaCollection(name: "Chás Especiais", boxColor: 4),
            TeaCollection(name: "Favoritos", boxColor: 1),
            TeaCollection(name: "Inverno", boxColor: 2)
        ]
    }
    
    @objc private func fabTapped() {
        print("FAB tocado!")
        
        // TODO: Mostrar menu de opções (Adicionar Coleção / Adicionar Chá)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionCell.identifier,
            for: indexPath
        ) as? CollectionCell else {
            return UICollectionViewCell()
        }
        
        let collection = collections[indexPath.item]
        
        cell.configure(with: collection)
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collection = collections[indexPath.item]
        
        print("Tocou na coleção: \(collection.name)")
        let teaShelfVC = TeaShelfViewController(collection: collection)
        navigationController?.pushViewController(teaShelfVC, animated: true)
        // TODO: Navegar para a tela dos chás
    }
}
