//
//  CustomButton.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 03/08/24.
//

import UIKit

class CustomButton: UIButton {
        
    enum Style {
        case voteButton
        case subscribeButton
        case closeButton
    }
        
    var style: Style = .voteButton {
        didSet {
            setStyle()
        }
    }
    
    private func setStyle() {
        
        layer.masksToBounds = false
        layer.cornerRadius = 10
        
        switch style {
        case .voteButton:
            titleLabel?.font = CustomFonts.Font.Bold(size: 16)
            backgroundColor = .Color900
            setTitleColor(.Color100, for: .normal)
            setImage(UIImage(systemName: "star.circle")?.withRenderingMode(.alwaysTemplate), for: .normal)
            imageView?.tintColor = .Color100
            layer.cornerRadius = 25
            
        case .subscribeButton:
            titleLabel?.font = CustomFonts.Font.Bold(size: 16)
            backgroundColor = .Color100
            setTitleColor(.Color900, for: .normal)
            setImage(UIImage(systemName: "person.crop.circle.badge.checkmark.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
            layer.borderColor = UIColor.Color900?.cgColor
            layer.borderWidth = 1.0
            layer.cornerRadius = 25
            
        case .closeButton:
            titleLabel?.font = CustomFonts.Font.Bold(size: 16)
            backgroundColor = .Color900
            layer.cornerRadius = 25
            setTitleColor(.Color100, for: .normal)
            setImage(UIImage(systemName: "clear")?.withRenderingMode(.alwaysTemplate), for: .normal)
            imageView?.tintColor = .Color100
            
        }
    
    }
    
}
