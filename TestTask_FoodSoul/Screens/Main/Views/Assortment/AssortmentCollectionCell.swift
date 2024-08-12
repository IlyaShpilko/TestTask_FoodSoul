//
//  AssortmentCollectionCell.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import UIKit

final class AssortmentCollectionCell: UICollectionViewCell {
    
    private let assortmentIconView = AssortmentIconView()
    private let titleLabel = LabelBuilder(with: .title).build
    private let descriptionLabel = LabelBuilder(with: .description).build
    private let weightLabel = LabelBuilder(with: .description).build
    private let priceLabel = LabelBuilder(with: .title).setTextAligement(to: .center).setTextColor(to: .red).build
    private let promoPriceLabel = LabelBuilder(with: .title).setFont(to: .boldSystemFont(ofSize: 12)).build
    
    private let toolCounterView = ToolCounterView()
    
    private var entity: ObjcAssortmentEntity?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10.0
    }
    
    func updateCell(entity: ObjcAssortmentEntity) {
        assortmentIconView.update(image: entity.image, favorite: entity.isFavorite, additional: entity.additionalInfo)
        self.entity = entity
        titleLabel.text = entity.title
        descriptionLabel.text = entity.recipeDescription
                
        let short = entity.price.currency.type.short
        let promo = entity.price.promoPrice
        
        priceLabel.text = "\(entity.price.price) \(short)"
        weightLabel.text = "\(entity.weight.weight) \(short)"
        
        if promo != -1 {
            promoPriceLabel.isHidden = false
            promoPriceLabel.text = "\(promo) \(short)"
            promoPriceLabel.setStrikethroughStyle()
        } else {
            promoPriceLabel.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        assortmentIconView.clear()
        titleLabel.text = nil
        descriptionLabel.text = nil
        weightLabel.text = nil
        priceLabel.text = nil
        promoPriceLabel.text = nil
        promoPriceLabel.isHidden = true
    }
}

extension AssortmentCollectionCell: BaseMethods {
    func addSettings() {
        backgroundColor = Colors.darkBlue2Prog.color
        clipsToBounds = true
    }
    
    func addSubviews() {
        contentView.addSubview(
            assortmentIconView,
            titleLabel,
            descriptionLabel,
            weightLabel,
            priceLabel,
            promoPriceLabel,
            toolCounterView
        )
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate(
            [
                assortmentIconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                assortmentIconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                assortmentIconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                assortmentIconView.heightAnchor.constraint(equalToConstant: 130),

                titleLabel.topAnchor.constraint(equalTo: assortmentIconView.bottomAnchor, constant: 8.0),
                titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
                titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4.0),
                
                descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
                descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
                descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
                
                weightLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6.0),
                weightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
                weightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
                
                priceLabel.topAnchor.constraint(greaterThanOrEqualTo: weightLabel.bottomAnchor, constant: 8.0),
                priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
                priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
                
                promoPriceLabel.topAnchor.constraint(greaterThanOrEqualTo: weightLabel.bottomAnchor, constant: 8.0),
                promoPriceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6.0),
                promoPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 2.0),
                
                toolCounterView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
                toolCounterView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            ]
        )
    }
    
    func addActions() {
        assortmentIconView.changedSelect = { [weak self] selected in
            self?.entity?.isFavorite = selected
        }
        
        toolCounterView.action = { [weak self] number in
            self?.entity?.counter += number
            self?.toolCounterView.isHiddenMinusButton = false
            
            if let counter =  self?.entity?.counter, counter < .zero {
                self?.entity?.counter = .zero
                self?.toolCounterView.isHiddenMinusButton = true
            }
        }
    }
}
