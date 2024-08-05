//
//  Environment.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 01/08/24.
//

import Foundation

struct Environment {
    
    //Variables definidas en los Build Settings > User-Defined settings.
    //Agregar variables en archivo Info.plist
    enum VariableName: String {
        case apiUrl = "API_URL"
        case imageUrl = "IMAGE_URL"
        case apiLanguage = "API_LANGUAGE"
        case apiKey = "API_KEY"
        case apiUrlDetailMovie = "API_URL_DETAIL_MOVIE"
    }
    
    static func getEnvironmentVariable(name: VariableName) -> String? {
        
        let environmentDictionary = Bundle.main.infoDictionary!
        let variable = environmentDictionary[name.rawValue] as? String

        return variable
    }
    
}
