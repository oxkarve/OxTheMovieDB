//
//  MovieListView.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation
import UIKit

class MovieListView: UIViewController {
    
    var mainView : MovieListTableView { self.view as! MovieListTableView }
    private var router = MovieListRouter()
    private var viewModel = MovieListViewModel()
    private var movies = [Movie]()
    var currentPage = 1
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // to do getDatalist
        viewModel.createBinding(view: self, router: router)
        viewModel.getMovieListData(page: currentPage)
        bindRefreshData()
    }
    
    override func loadView() {
        view = MovieListTableView()
        mainView.movieListTableView.delegate = self
        mainView.movieListTableView.dataSource = self
    }
    
    private func bindRefreshData() {
        viewModel.refreshData = { [weak self] () in
           DispatchQueue.main.async {
               self?.mainView.activityIndicator.stop()
               self?.mainView.movieListTableView.reloadData()
           }
            
        }
    }
    
    
}

extension MovieListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
        let movie = self.viewModel.movies[indexPath.row]
        cell.setupCellData(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToMovieDetailView(movieId: String(self.viewModel.movies[indexPath.row].movieId))
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let totalRows = tableView.numberOfRows(inSection: indexPath.section)
        
        if indexPath.row == totalRows - 1 {
            //Ultima celda alcanzada
            currentPage += 1
            viewModel.getMovieListData(page: currentPage)
        }
    }
}


