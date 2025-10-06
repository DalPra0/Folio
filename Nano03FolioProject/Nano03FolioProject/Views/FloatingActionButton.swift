//
//  FloatingActionButton.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 06/10/25.
//

import Foundation
import UIKit

class FloatingActionButton: UIButton {
    
    
    private let shadowLayer = CAShapeLayer()
    
    
    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupButton() {
        var config = UIButton.Configuration.plain()
        
        config.title = "Adicionar chá"
        config.baseForegroundColor = .black
        
        if let plantImage = UIImage(named: "plantinhaBotaoAdicionar") {
            let targetSize = CGSize(width: 30, height: 30)
            let resizedImage = plantImage.resized(to: targetSize)
            config.image = resizedImage
        }
        config.imagePlacement = .leading
        config.imagePadding = 8
        
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)
        
        config.background.backgroundColor = .white
        config.background.cornerRadius = 20
        
        configuration = config
        
        titleLabel?.font = UIFont(name: "Pangolin-Regular", size: 18)
        
        clipsToBounds = false
        
        setupShadowLayer()
        
        addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    }
    
    private func setupShadowLayer() {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 0, y: layer.cornerRadius))
        
        path.addLine(to: CGPoint(x: 0, y: bounds.height - layer.cornerRadius))
        path.addArc(withCenter: CGPoint(x: layer.cornerRadius, y: bounds.height - layer.cornerRadius),
                    radius: layer.cornerRadius,
                    startAngle: .pi,
                    endAngle: .pi / 2,
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: bounds.width - layer.cornerRadius, y: bounds.height))
        path.addArc(withCenter: CGPoint(x: bounds.width - layer.cornerRadius, y: bounds.height - layer.cornerRadius),
                    radius: layer.cornerRadius,
                    startAngle: .pi / 2,
                    endAngle: 0,
                    clockwise: false)
        
        path.addLine(to: CGPoint(x: bounds.width, y: layer.cornerRadius))
        
        shadowLayer.path = path.cgPath
        shadowLayer.strokeColor = UIColor.black.cgColor
        shadowLayer.lineWidth = 4  // Grossura do stroke
        shadowLayer.fillColor = UIColor.clear.cgColor
        
        layer.insertSublayer(shadowLayer, at: 0)
    }

    @objc private func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(translationX: 2, y: 2)
            
            self.shadowLayer.lineWidth = 2
        }
    }

    @objc private func buttonReleased() {
        UIView.animate(withDuration: 0.1) {
            self.transform = .identity
            
            self.shadowLayer.lineWidth = 4
        }
    }
    

    func addToView(_ view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowLayer.removeFromSuperlayer()
        
        setupShadowLayer()
    }
}
