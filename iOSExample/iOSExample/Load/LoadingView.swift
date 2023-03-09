//
//  LoadingView.swift
//  iOSExample
//
//  Created by admin on 9/03/23.
//

import UIKit

final class LoadingView: UIView {
    private let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.cornerRadius = 5
        
        if activityIndicatorView.superview == nil {
            addSubview(activityIndicatorView)
            
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            activityIndicatorView.startAnimating()
        }
    }
    
    public func animate() {
        isUserInteractionEnabled = true
        activityIndicatorView.color = .white
        activityIndicatorView.startAnimating()
    }
}
