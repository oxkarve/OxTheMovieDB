//
//  StarRateComponent.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 03/08/24.
//

import UIKit

class StarRateComponent: UIView {

    private let topStars = 5
    private var starImages: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        
        for _ in 1...topStars {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            stackView.addArrangedSubview(imageView)
            starImages.append(imageView)
        }
        
        setRating(to: 0)
    }
    
    func setRating(to rate: Double) {
        let flatRate = Int(((rate * 5) / 10).rounded())
        for (index, imageView) in starImages.enumerated() {
            let starName = index < flatRate ? "star.fill" : "star"
            imageView.image = UIImage(systemName: starName)?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = .Color900
        }
    }
    
}
