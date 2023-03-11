//
//  Loadable.swift
//  SampleApp
//
//  Created by admin on 9/03/23.
//

import UIKit

protocol Loadable {
    func showLoadingView()
    func hideLoadingView()
}

fileprivate struct Constants {
    /// an arbitrary tag id for the loading view, so it can be retrieved later without keeping a reference to it
    fileprivate static let loadingViewTag = 1234
}

/// Default implementation for UIViewController
extension Loadable where Self: UIViewController {
    
    func showLoadingView() {
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.isUserInteractionEnabled = true
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
        let loadingView = LoadingView()
        containerView.addSubview(loadingView)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        loadingView.animate()
        
        containerView.tag = Constants.loadingViewTag
    }
    
    func hideLoadingView() {
        view.subviews.forEach { subview in
            if subview.tag == Constants.loadingViewTag {
                subview.removeFromSuperview()
            }
        }
    }
}
