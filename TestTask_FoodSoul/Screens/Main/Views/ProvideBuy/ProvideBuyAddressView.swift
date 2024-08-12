//
//  ProvideBuyAddressView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

final class ProvideBuyAddressView: UIView {
    
    private let titleLabel = LabelBuilder(with: .title).build
    private let imageView = ImageViewBuilder().build
    
    private let constant: CGFloat = 10.0
    
    var action: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
    }
    
    func update(entity: ProvideBuyAddressViewEntity) {
        imageView.image = entity.image
        titleLabel.text = entity.title
    }
    
    func prepareForClosing() {
        titleLabel.removeAllConstraints()
        titleLabel.translatesAutoresizingMaskIntoConstraints = true
        imageView.removeAllConstraints()
        imageView.translatesAutoresizingMaskIntoConstraints = true
        self.removeAllConstraints()
    }
    
    func updateUI() {
        addConstraints()
    }
}

extension ProvideBuyAddressView: BaseMethods {
    func addSettings() {
        backgroundColor = .darkBlueProg
    }
    
    func addSubviews() {
        addSubview(titleLabel, imageView)
    }
    
    func addConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: constant),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: constant),
                titleLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -constant),
                
                imageView.topAnchor.constraint(equalTo: topAnchor, constant: constant),
                imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant),
                imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -constant),
                imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ]
        )
    }
    
    func addGestureRecognizers() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
    }
}

@objc extension ProvideBuyAddressView {
    func tapped() {
        action?()
    }
}
