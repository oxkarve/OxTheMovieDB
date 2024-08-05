//
//  MovieListRouter.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation
import UIKit

class MovieListRouter {
    //Creamos instancia de viewcontroller
    var viewController: UIViewController {
        return getViewController()
    }
    var currentPage = 1
    private var originView: UIViewController?
    
    private func getViewController() -> UIViewController {
        let view = MovieListView()
        view.currentPage = self.currentPage
        view.title = "Top Películas Stori"
        return view
    }
    //seteamos controller origen
    func setOriginView(_ originView: UIViewController?){
        guard let view = originView else {fatalError("Unknown error")}
        self.originView = view
    }
    
    //Navegacion hacia el detalle
    func goToMovieDetailView(movieId: String){
        let movieDetailView = MovieDetailRouter(movieId: movieId).viewController
        originView?.navigationController?.pushViewController(movieDetailView, animated: true)
        
    }
}
