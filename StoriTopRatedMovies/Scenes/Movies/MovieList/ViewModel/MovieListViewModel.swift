//
//  MovieListViewModel.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation

class MovieListViewModel {
    private var requestManager = RequestManager()
    private weak var view : MovieListView?
    private var router: MovieListRouter?
    var currentPage = 1
    
    func createBinding(view: MovieListView, router: MovieListRouter){
        self.view = view
        self.router = router
        self.router?.setOriginView(view)
    }
    
    func getMovieListData(page: Int){
        view?.mainView.activityIndicator.start()
            self.requestManager.getTopRatedMovies(page: page) { [weak self] response in
                self?.movies.append(contentsOf: response.results)

            }
    }
    
    func navigateToMovieDetailView(movieId: String) {
        router?.goToMovieDetailView(movieId: movieId)
    }
    
    var refreshData = { () -> () in }
    
    var movies = [Movie]() {
        didSet {
            refreshData()
        }
    }
}


