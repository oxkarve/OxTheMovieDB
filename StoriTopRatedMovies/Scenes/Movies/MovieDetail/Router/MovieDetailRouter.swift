//
//  MovieDetailRouter.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import Foundation
import UIKit

class MovieDetailRouter {
    //Creamos instancia de viewcontroller
    var viewController: UIViewController {
        return getViewController()
    }
    var movieId: String?
    var movie: Movie?
    
    private var originView: UIViewController?
    
    init(movieId: String? = "") {
        self.movieId = movieId
    }

    private func getViewController() -> UIViewController {
        let view = MovieDetailView()
        view.movieId = self.movieId
        return view
    }
    //seteamos controller origen
    func setOriginView(_ originView: UIViewController?){
        guard let view = originView else {fatalError("Unknown error")}
        self.originView = view
    }
    
    //Navegacion hacia el modal con info para suscribirte
    func goToSubscriptionView(){
        let subscriptionView = SubscriptionRouter().viewController
        originView?.modalPresentationStyle = .overFullScreen
        originView?.modalTransitionStyle = .coverVertical
        originView?.present(subscriptionView, animated: true)
        
    }
}
