//
//  SubscriptionRouter.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 03/08/24.
//

import Foundation
import UIKit

class SubscriptionRouter {
       
        //Creamos instancia de viewcontroller
        var viewController: UIViewController {
            return getViewController()
        }

        private var originView: UIViewController?
        
        private func getViewController() -> UIViewController {
            let view = SubscriptionView()
            view.title = "Suscribete"
            return view
        }
        //seteamos controller origen
        func setOriginView(_ originView: UIViewController?){
            guard let view = originView else {fatalError("Unknown error")}
            self.originView = view
        }

}
