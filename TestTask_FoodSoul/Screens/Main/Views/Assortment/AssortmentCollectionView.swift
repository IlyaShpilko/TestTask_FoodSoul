//
//  AssortmentCollectionView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/4/24.
//

import UIKit

final class AssortmentCollectionView: UICollectionView {
    
    private let inset: CGFloat
    private let layout: UICollectionViewFlowLayout
    private let cellHeight: CGFloat = 320.0
    
    @objc var items: [ObjcAssortmentEntity] = [] {
        didSet {
            setHeight()
            reloadData()
        }
    }
    
    @objc init(inset: CGFloat) {
        self.inset = inset
        self.layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout.sectionInset = UIEdgeInsets(top: .zero, left: inset, bottom: .zero, right: inset)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: bounds.width / 2 - inset * 2, height: cellHeight)
    }
}

private extension AssortmentCollectionView {
    func setHeight() {
        removeAllConstraints()
        let height = cellHeight * (items.count.cgFloat / 2).rounded(.up) + inset * 2
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

extension AssortmentCollectionView: BaseMethods {
    func addSettings() {
        backgroundColor = .clear
    }
    
    func addDelegates() {
        self.dataSource = self
    }
}

extension AssortmentCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(with: AssortmentCollectionCell.self, for: indexPath) else { fatalError() }
        cell.updateCell(entity: items[indexPath.item])
        return cell
    }
}
