//
//  MovieDetailView.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation
import UIKit

class MovieDetailView: UIViewController {
    
    private var movie = Movie()
    var movieId : String?
    
    var mainView : MovieView { self.view as! MovieView }
    private var router = MovieDetailRouter()
    private var viewModel = MovieDetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataAndDisplayMovie()
        viewModel.createBinding(view: self, router: router)
        bindRefreshData()
        setupButtonActions()
    }
    
    override func loadView() {
        view = MovieView()
    }
    
    func setupButtonActions() {
        mainView.voteButton.addTarget(self, action: #selector(navigateSubscriptionModal), for: .touchUpInside)
        mainView.subscribeButton.addTarget(self, action: #selector(navigateSubscriptionModal), for: .touchUpInside)
    }
    
    func getDataAndDisplayMovie(){
        guard let movieId = movieId else {return}
        mainView.loadingView.start()
        viewModel.getMovieDetail(movieId: movieId)
    }
    
    private func bindRefreshData() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.mainView.loadingView.stop()
                self?.mainView.setMovieViewDetail(movie: (self?.viewModel.movie)!)
            }
            
        }
    }
    
    @objc func navigateSubscriptionModal(){
        viewModel.navigateToSubscriptionView()
    }
    
}
