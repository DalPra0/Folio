//
//  CollectionCell.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 04/10/25.
//
import UIKit
import Foundation

class CollectionCell: UICollectionViewCell {
    
    static let identifier = "CollectionCell"
    
    private let boxImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let teaCountLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.1
        layer.masksToBounds = false
        
        contentView.addSubview(boxImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(teaCountLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            boxImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            boxImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            boxImageView.widthAnchor.constraint(equalToConstant: 80),
            boxImageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: boxImageView.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            teaCountLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            teaCountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            teaCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            teaCountLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func configure(with collection: TeaCollection) {
        nameLabel.text = collection.name
        
        teaCountLabel.text = "\(collection.teaCount) chá\(collection.teaCount == 1 ? "" : "s")"
        
        // TODO: Substituir por assets reais quando tiver
        boxImageView.image = UIImage(systemName: "shippingbox.fill")
        boxImageView.tintColor = getColorForBox(variant: collection.boxColor)
    }


    private func getColorForBox(variant: Int) -> UIColor {
        switch variant {
        case 1: return .systemBrown
        case 2: return .systemOrange
        case 3: return .systemGreen
        case 4: return .systemBlue
        default: return .systemBrown
        }
    }
}
