//
//  CustomFonts.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 03/08/24.
//

import UIKit

public class CustomFonts {
    
    enum FontName: String {
        case antonioLight = "Antonio-Light"
        case antonioRegular = "Antonio-Regular"
        case antonioBold = "Antonio-Bold"
    }
    
    enum Font {
        static func Light(size: CGFloat) -> UIFont {
            UIFont(name: FontName.antonioLight.rawValue, size: size)!
        }
        static func Regular(size: CGFloat) -> UIFont {
            UIFont(name: FontName.antonioRegular.rawValue, size: size)!
        }
        static func Bold(size: CGFloat) -> UIFont {
            UIFont(name: FontName.antonioBold.rawValue, size: size)!
        }
    }
    
    enum FontSize: CGFloat {
        case small = 12.0
        case regular = 14.0
        case xregular = 16.0
    }
    
}

