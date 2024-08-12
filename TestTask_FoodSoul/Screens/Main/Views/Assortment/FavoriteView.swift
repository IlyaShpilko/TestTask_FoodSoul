//
//  FavoriteView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import UIKit

final class FavoriteView: UIView {
    
    var changedSelect: ((_ selected: Bool) -> Void)?
    
    private let imageView = ImageViewBuilder().build
    
    var selected: Bool = false {
        didSet {
            imageView.tintColor = selected ? .red : .grayProg
        }
    }
    
    init() {
        super.init(frame: .zero)
        imageView.image = Icons.heart.image
        addSubview(imageView)
        imageView.pin(to: self, constant: 4.0)
        backgroundColor = .darkBlueProg
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        widthAnchor.constraint(equalTo: heightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
    }
    
    @objc private func tapped() {
        selected.toggle()
        changedSelect?(selected)
    }
}
