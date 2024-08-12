//
//  AssortmentIconView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/8/24.
//

import UIKit

final class AssortmentIconView: UIView {
    
    private let imageView = ImageViewBuilder().setContentMode(.scaleAspectFill).build
    private let favoriteView = FavoriteView()
    
    var changedSelect: ((Bool) -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        imageView.layer.cornerRadius = 10.0
    }
    
    func update(image: UIImage?, favorite selected: Bool, additional infos: [AdditionalInfo]) {
        imageView.image = image
        favoriteView.selected = selected
        addAdditionalInfos(to: infos)
    }
    
    func clear() {
        imageView.image = nil
        favoriteView.selected = false
        deleteAdditionalInfo()
    }
}

private extension AssortmentIconView {
    func addAdditionalInfos(to infos: [AdditionalInfo]) {
        deleteAdditionalInfo()
        var previous: UIView? = nil
        var titles = Set<String>()
        var counter = 0
        
        infos.forEach {
            if !titles.contains($0.name) && counter < 3 {
                let view = AdditionalView()
                view.update(title: $0.name, background: $0.color)
                addSubview(view)
                if let previous {
                    view.addConstraints(view: previous, isFirst: false)
                } else {
                    view.addConstraints(view: imageView, isFirst: true)
                }
                previous = view
                counter += 1
                titles.insert($0.name)
            }
        }
    }
    
    func deleteAdditionalInfo() {
        subviews.forEach {
            if let view = $0 as? AdditionalView {
                view.removeFromSuperview()
            }
        }
    }
}

extension AssortmentIconView: BaseMethods {
    func addSettings() {
        clipsToBounds = true
    }
    
    func addSubviews() {
        addSubview(
            imageView,
            favoriteView
        )
    }
    
    func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        imageView.pin(to: self)
        
        NSLayoutConstraint.activate(
            [
                imageView.heightAnchor.constraint(equalToConstant: 130),
                
                favoriteView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10.0),
                favoriteView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10.0),
            ]
        )
    }
    
    func addActions() {
        favoriteView.changedSelect = { [weak self] selected in
            self?.changedSelect?(selected)
        }
    }
}
