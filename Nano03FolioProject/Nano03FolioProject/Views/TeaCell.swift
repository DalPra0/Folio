//
//  TeaCell.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 06/10/25.
//

import Foundation
import UIKit

class TeaCell: UICollectionViewCell {
    
    static let identifier = "TeaCell"
    
    private let teaImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .systemBrown
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.textColor = .systemGray
        return label
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 2)
        contentView.layer.shadowRadius = 4
        contentView.layer.shadowOpacity = 0.1
        
        contentView.addSubview(teaImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(typeLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            teaImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            teaImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            teaImageView.widthAnchor.constraint(equalToConstant: 60),
            teaImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: teaImageView.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            typeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            typeLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    

    func configure(with tea: Tea) {
        nameLabel.text = tea.name
        
        typeLabel.text = tea.type.displayName
        
        // TODO: Substituir por assets reais quando tiver
        switch tea.type {
        case .teaBag:
            teaImageView.image = UIImage(systemName: "square.fill")
        case .teaCup:
            teaImageView.image = UIImage(systemName: "cup.and.saucer.fill")
        }
        
        teaImageView.tintColor = getColorForVariant(tea.variant)
    }


    private func getColorForVariant(_ variant: Int) -> UIColor {
        switch variant {
        case 1: return .systemBrown
        case 2: return .systemGreen
        case 3: return .systemOrange
        case 4: return .systemPurple
        default: return .systemBrown
        }
    }
}
