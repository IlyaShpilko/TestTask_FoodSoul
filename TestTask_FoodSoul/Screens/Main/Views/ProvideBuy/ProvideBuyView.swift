//
//  ProvideBuyView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/3/24.
//

import UIKit

@objc protocol ProvideBuyViewDelegate: AnyObject {
    func openAddress()
}

final class ProvideBuyView: UIView {
    
    private let stackView = StackViewBuilder(with: .vertical)
        .setDistribution(to: .fillEqually)
        .setSpacing(to: 8.0)
        .build
    
    private let segmentedControlView = SegmentedControlView()
    private let provideBuyAddressView = ProvideBuyAddressView()
    
    private var height: NSLayoutConstraint?

    @objc weak var delegate: ProvideBuyViewDelegate?
    
    @objc var needChange: Bool {
        get {
            segmentedControlView.needChange
        }
        set {
            segmentedControlView.needChange = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        layer.cornerRadius = 8.0
    }
    
    @objc func update(model: ProvideModel) {
        segmentedControlView.addItems(to: model.types.map { $0.string })
        provideBuyAddressView.update(entity: model.address)
    }
    
    private func updateHeight(constant: CGFloat = 120, animate: Bool = false, additional: (() -> Void)? = nil) {
        if animate {
            let v = UIViewPropertyAnimator(duration: 0.2, curve: .easeInOut) {
                additional?()
                updateHeight(constant: constant)
                self.layoutIfNeeded()
            }
            v.startAnimation()
        } else {
            updateHeight(constant: constant)
        }
        
        func updateHeight(constant: CGFloat) {
            height?.isActive = false
            height = nil
            height = heightAnchor.constraint(equalToConstant: constant)
            height?.isActive = true
        }
    }
}

extension ProvideBuyView:BaseMethods {
    func addSettings() {
        backgroundColor = UIColor.darkBlue2Prog
    }
    
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(segmentedControlView, provideBuyAddressView)
    }
    
    func addConstraints() {
        stackView.pin(to: self, constant: 10.0)
        updateHeight(animate: false)
    }
    
    func addDelegates() {
        segmentedControlView.delegate = self
    }
    
    func addActions() {
        provideBuyAddressView.action = { [weak self] in
            self?.delegate?.openAddress()
        }
    }
}

extension ProvideBuyView: SegmentedControlViewDelegate {
    func showExtensionInfo(name: String?) {
        guard let name else { return }
        
        needChange = false
        switch ProvideBuyType.check(to: name) {
        case .delivery:
            provideBuyAddressView.updateUI()
            
            updateHeight(animate: true) {
                self.provideBuyAddressView.alpha = 1.0
                self.provideBuyAddressView.isHidden = false
            }
            
        case .pickup:
            provideBuyAddressView.prepareForClosing()
            
            updateHeight(constant: 66, animate: true) {
                self.provideBuyAddressView.alpha = 0.0
                self.provideBuyAddressView.isHidden = true
            }
        case .none: break
        }
    }
}
