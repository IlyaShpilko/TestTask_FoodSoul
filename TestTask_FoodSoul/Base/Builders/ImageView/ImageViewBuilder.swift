//
//  ImageViewBuilder.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/6/24.
//

import UIKit

final class ImageViewBuilder: NSObject {
    
    private var imageView: UIImageView!
    private var model = ImageViewModel()
    
    var build: UIImageView {
        imageView.contentMode = model.contentMode
        imageView.tintColor = model.tintColor
        imageView.translatesAutoresizingMaskIntoConstraints = model.translatesAutoresizingMaskIntoConstraints
        imageView.clipsToBounds = model.clipToBounds
        return imageView
    }
    
    override init() {
        super.init()
        self.imageView = UIImageView()
    }
    
    func setContentMode(_ contentMode: UIView.ContentMode = .scaleAspectFit) -> Self {
        self.model.contentMode = contentMode
        return self
    }
    
    func setTranslatesAutoresizingMaskIntoConstraints(_ bool: Bool = false) -> Self {
        self.model.translatesAutoresizingMaskIntoConstraints = bool
        return self
    }
    
    func setTintColor(_ color: UIColor? = .white) -> Self {
        model.tintColor = color
        return self
    }
    
    func setClipToBounds(_ bool: Bool = true) -> Self {
        model.clipToBounds = bool
        return self
    }
    
    private func create() -> UIImageView {
        return UIImageView()
    }
}

struct ImageViewModel {
    var contentMode: UIView.ContentMode
    var tintColor: UIColor?
    var clipToBounds: Bool
    var translatesAutoresizingMaskIntoConstraints: Bool
    
    init(
        contentMode: UIView.ContentMode = .scaleAspectFit,
        tintColor: UIColor? = .white,
        clipToBounds: Bool = true,
        translatesAutoresizingMaskIntoConstraints: Bool = false
    ) {
        self.contentMode = contentMode
        self.tintColor = tintColor
        self.clipToBounds = clipToBounds
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
    }
}
