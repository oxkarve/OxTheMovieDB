//
//  MovieListTableView.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import UIKit

class MovieListTableView: UIView {
        
    let activityIndicator : LoadingIndicator = {
        let activity = LoadingIndicator()
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    let movieListTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: "MovieListTableViewCell")
        tableView.rowHeight = 180
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .Color300
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        addSubview(movieListTableView)
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            movieListTableView.topAnchor.constraint(equalTo: topAnchor),
            movieListTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieListTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieListTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}


