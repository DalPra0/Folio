//
//  UIImage+Extensions.swift
//  Nano03FolioProject
//
//  Created by Lucas Dal Pra Brascher on 06/10/25.
//

import UIKit

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
