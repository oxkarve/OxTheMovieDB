//
//  SubscriptionView.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 03/08/24.
//

import UIKit

class SubscriptionView: UIViewController {
    
    private var router = SubscriptionRouter()
    private var viewModel = SubscriptionViewModel()
    
    private lazy var modalPopUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .Color100
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var closeButton: CustomButton = {
        let button = CustomButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .closeButton
        button.addTarget(self, action:#selector(closeModal), for: .touchUpInside)
        return button
    }()
    
    private let containerView: UIStackView = {
        let container = UIStackView()
        container.axis = .vertical
        container.spacing = 5
        container.distribution = .fill
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Bold(size: 18)
        label.textColor = .Color900
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Regular(size: 16)
        label.textColor = .Color900
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let grettingImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.image = UIImage(systemName: "hands.sparkles.fill")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .Color900
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPopUpView()
    }
    
    func setUpPopUpView() {
        
        titleLabel.text = "Regístrate o inicia sesión para que puedas seguir disfrutando"
        messageLabel.text = "Vota, agrega a tus favoritos, crea listas con tus selecciones y ten acceso a la información más reciente en el mundo de las películas"
        
        self.view.backgroundColor = .Color800?.withAlphaComponent(0.1)
        self.view.addSubview(modalPopUpView)
        modalPopUpView.addSubview(closeButton)
        modalPopUpView.addSubview(containerView)
        containerView.addArrangedSubview(grettingImageView)
        containerView.addArrangedSubview(titleLabel)
        containerView.addArrangedSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            modalPopUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalPopUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modalPopUpView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            modalPopUpView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.topAnchor.constraint(equalTo: modalPopUpView.topAnchor, constant: 5),
            closeButton.trailingAnchor.constraint(equalTo: modalPopUpView.trailingAnchor, constant: -5),
            
            containerView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: modalPopUpView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: modalPopUpView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: modalPopUpView.bottomAnchor, constant: -50),
            
            grettingImageView.heightAnchor.constraint(equalToConstant: 80),
            grettingImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func closeModal() {
        dismiss(animated: true, completion: nil)
    }
}
