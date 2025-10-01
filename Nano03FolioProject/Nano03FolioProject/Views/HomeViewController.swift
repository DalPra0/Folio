//
//  HomeViewController.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 01/10/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.text = "Ola estante funcionando"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        title = "Minha estante"
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(testLabel)
        
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
