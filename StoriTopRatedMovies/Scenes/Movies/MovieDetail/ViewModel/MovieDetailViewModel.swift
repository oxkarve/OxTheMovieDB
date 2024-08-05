//
//  MovieDetailViewModel.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation

class MovieDetailViewModel {
    private var requestManager = RequestManager()
    private weak var view : MovieDetailView?
    private var router: MovieDetailRouter?

    func createBinding(view: MovieDetailView, router: MovieDetailRouter){
        self.view = view
        self.router = router
        self.router?.setOriginView(view)
    }
    
    func getMovieDetail(movieId: String){
        requestManager.getMovieDetali(movieId: movieId) { [weak self] movie in
            self?.movie = movie
        }
    }
    
    var refreshData = { () -> () in }
    
    var movie = Movie() {
        didSet {
            refreshData()
        }
    }
    
    func navigateToSubscriptionView() {
        router?.goToSubscriptionView()
    }
}
