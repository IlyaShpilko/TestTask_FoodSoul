//
//  CollectionView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

@objc protocol PromotionCollectionViewDelegate: AnyObject {
    func openPromo()
}

final class PromotionCollectionView: UICollectionView {
    
    private let inset: CGFloat
    private let layout: UICollectionViewFlowLayout
    
    @objc weak var promoDelegate: PromotionCollectionViewDelegate?
    
    @objc var items: [Promotion] = [] {
        didSet {
            reloadData()
        }
    }
    
    // MARK: - Inits
    @objc init(inset: CGFloat) {
        self.inset = inset
        self.layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .clear
        setupProtocols()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
}

// MARK: - Base Methods
private extension PromotionCollectionView {
    func setupProtocols() {
        dataSource = self
        delegate = self
    }
    
    func setupLayout() {
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.itemSize = CGSize(width: 300, height: bounds.height)
        layout.minimumLineSpacing = 20.0
    }
}

// MARK: - UI Collection View Data Source
extension PromotionCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(with: PromotionCollectionCell.self, for: indexPath) else { fatalError() }
        cell.updatePromotion(to: items[indexPath.item])
        return cell
    }
}

// MARK: - UI Collection View Delegate
extension PromotionCollectionView: UICollectionViewDelegate { 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        promoDelegate?.openPromo()
    }
}
