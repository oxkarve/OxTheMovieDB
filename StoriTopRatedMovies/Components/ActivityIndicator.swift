//
//  ActivityIndicator.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 03/08/24.
//

import UIKit

class LoadingIndicator : UIView {
    
    private let loadingIndicator = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLoadingIndicator()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLoadingIndicator()
    }
    
    private func setupLoadingIndicator() {
        self.backgroundColor = .Color900?.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(loadingIndicator)
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func start(){
        loadingIndicator.startAnimating()
        self.isHidden = false
    }
    
    func stop(){
        loadingIndicator.stopAnimating()
        self.isHidden = true
    }
}
