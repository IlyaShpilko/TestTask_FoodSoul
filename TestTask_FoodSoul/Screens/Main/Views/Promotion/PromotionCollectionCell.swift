//
//  PromotionCollectionCell.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

final class PromotionCollectionCell: UICollectionViewCell {
    
    private let imageView = ImageViewBuilder().setContentMode(.scaleAspectFit).build
    
    private let titleLabel = LabelBuilder(with: .title).build
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func prepareForReuse() {
        updatePromotion(to: .init())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 12.0
    }
    
    func updatePromotion(to promotion: Promotion) {
        imageView.image = promotion.image
        titleLabel.text = promotion.title
    }
}

extension PromotionCollectionCell: BaseMethods {
    func addSettings() {
        contentView.backgroundColor = .clear
    }
    
    func addSubviews() {
        contentView.addSubview(imageView, titleLabel)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate(
            [
                imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                imageView.heightAnchor.constraint(equalToConstant: 150),
                
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ]
        )
    }
}

