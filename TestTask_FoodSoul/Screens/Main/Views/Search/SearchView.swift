//
//  SearchView.swift
//  TestProject
//
//  Created by Ilya Shpilko on 8/9/24.
//

import UIKit

@objc protocol SearchViewDelegate: AnyObject {
    func filtering(to text: String?)
}

final class SearchView: UIView {
    
    private let textField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .darkBlue2Prog
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leftView = UIView(frame: CGRect(x: .zero, y: .zero, width: 12, height: textField.bounds.width))
        textField.leftViewMode = .always
        textField.attributedPlaceholder = NSAttributedString(
            string: StringResourses.what_are_you_search.text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.grayProg]
        )
        textField.tintColor = .red
        textField.textColor = .white
        return textField
    }()
    
    private let tapView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var gradient: CAGradientLayer!
    private var isStarted: Bool = false
    private var closing: Bool = false
    
    @objc weak var delegate: SearchViewDelegate!
    
    @objc init(point: CGPoint, width: CGFloat) {
        super.init(frame: CGRect(origin: point, size: .init(width: width, height: .zero)))
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textField.layer.cornerRadius = 12.0
        search(textField)
        
        if let superview, !isStarted {
            self.textField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
            UIView.animate(withDuration: 0.5, delay: .zero, usingSpringWithDamping: 0.8, initialSpringVelocity: .zero) {
                self.gradient.frame.size.height = superview.frame.height
                self.frame.size.height = superview.frame.height
                self.layoutIfNeeded()
            } completion: { completed in
                if completed {
                    self.textField.becomeFirstResponder()
                    self.updateTapView()
                    self.isStarted = true
                }
            }
        }
    }
    
    func updateTapView() {
        NSLayoutConstraint.activate(
            [
                tapView.topAnchor.constraint(equalTo: textField.bottomAnchor),
                tapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                tapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                tapView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ]
        )
    }
}

extension SearchView: BaseMethods {
    func addSettings() {
        gradient = addGradient()
    }
    
    func addSubviews() {
        addSubview(textField, tapView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate(
            [
                textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.0),
                textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12.0),
                textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12.0),
            ]
        )
    }
    
    func addDelegates() {
        textField.delegate = self
    }
    
    func addTargets() {
        textField.addTarget(self, action: #selector(search), for: .editingChanged)
    }
    
    func addGestureRecognizers() {
        tapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(close)))
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        updateTextField(selected: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateTextField(selected: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        close()
        return true
    }
}

private extension SearchView {
    func updateTextField(selected: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.textField.layer.borderColor = selected ? UIColor.red.cgColor : UIColor.grayProg.cgColor
            self.textField.layer.borderWidth = 0.7
        }
    }
}

@objc private extension SearchView {
    func close() {
        self.closing = true
        self.textField.resignFirstResponder()
        self.textField.text = nil
        self.textField.removeAllConstraints()
        self.textField.translatesAutoresizingMaskIntoConstraints = true
        self.removeAllConstraints()
        self.tapView.removeAllConstraints()

        UIView.animate(withDuration: 0.5, delay: .zero, usingSpringWithDamping: 0.8, initialSpringVelocity: .zero) {
            self.layoutIfNeeded()
            self.textField.frame.size.height = .zero
            self.gradient.frame.size.height = .zero
            self.frame.size.height = .zero
        } completion: { [weak self] completed in
            if completed {
                self?.removeFromSuperview()
            }
        }
    }
    
    func search(_ sender: UITextField) {
        guard !closing else { return }
        delegate.filtering(to: sender.text)
    }
}
