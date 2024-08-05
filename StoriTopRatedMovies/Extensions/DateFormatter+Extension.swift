//
//  DateFormatter+Extension.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 03/08/24.
//

import Foundation

extension DateFormatter {
    
    static let stringDateToDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    static let explicitDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMMM 'de' yyyy"
        return dateFormatter
    }()
}
