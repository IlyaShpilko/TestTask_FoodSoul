//
//  SegmentedControlView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

protocol SegmentedControlViewDelegate: AnyObject {
    func showExtensionInfo(name: String?)
}

final class SegmentedControlView: UIView {
    
    private let stackView = StackViewBuilder(with: .horizontal)
        .setDistribution(to: .fillEqually)
        .setTranslatesAutoresizingMaskIntoConstraints(to: true)
        .build
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    weak var delegate: SegmentedControlViewDelegate?
    
    var needChange = true
    
    private var index = 0 {
        didSet {
            delegate?.showExtensionInfo(name: (stackView.subviews[index] as? UILabel)?.text)
        }
    }
    
    init() {
        super.init(frame: .zero)
        addSubview(backgroundView, stackView)
        backgroundColor = .darkBlueProg
        clipsToBounds = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
        
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard needChange else { return }
        layer.cornerRadius = frame.height / 2
        stackView.frame = bounds
        if !stackView.arrangedSubviews.filter({ $0.frame != .zero }).isEmpty {
            let width = stackView.frame.width / 2
            selectedView(
                frame: CGRect(
                    x: index == .zero ? .zero : width,
                    y: .zero,
                    width: width,
                    height: stackView.frame.height),
                animated: false
            )
        }
    }
    
    func addItems(to items: [Any]?) {
        if let items {
            items.enumerated().map {
                LabelBuilder(with: .title)
                    .setText(to: "\($0.element)")
                    .setTag(to: $0.offset)
                    .setTextAligement(to: .center)
                    .build
            }.forEach {
                stackView.addArrangedSubview($0)
            }
        } else {
            removeFromSuperview()
        }
    }
}

private extension SegmentedControlView {
    
    func findIndex(_ point: CGPoint) -> Int? {
        for view in stackView.subviews {
            if point.x - view.frame.minX < view.frame.width {
                selectedView(frame: view.frame)
                return view.tag
            }
        }
        return .zero
    }
    
    func selectedView(frame: CGRect, animated: Bool = true) {
        if animated {
            UIView.animate(withDuration: 0.2) {
                selectedView(frame: frame)
            }
        } else {
            selectedView(frame: frame)
        }
        
        func selectedView(frame: CGRect) {
            backgroundView.frame = frame
        }
    }
}

@objc private extension SegmentedControlView {
    func tapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: self)
        index = findIndex(location) ?? .zero
    }
}
