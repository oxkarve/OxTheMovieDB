//
//  MovieView.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import UIKit

class MovieView: UIView {
    
    lazy var loadingView : LoadingIndicator = {
        let activityIndicator = LoadingIndicator()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    lazy var imagesContainerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .Color100?.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let movieBackView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let movieImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10.0
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var movieNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Bold(size: 22)
        label.textColor = .Color900
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = .Color100?.withAlphaComponent(0.8)
        return label
    }()
    
    lazy var descriptionContainerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .Color100?.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var movieDescriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Light(size: 18)
        label.textColor = .Color800
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = .Color100?.withAlphaComponent(0.8)
        return label
    }()
    
    internal lazy var movieDateLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Regular(size: 20)
        label.textColor = .Color700
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = .Color100?.withAlphaComponent(0.8)
        return label
    }()
    
    internal lazy var movieRateLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Light(size: 15)
        label.textColor = .Color800
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.backgroundColor = .brown
        return label
    }()
    
    lazy var rateContainerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .Color100?.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var rateComponent: StarRateComponent = {
        let rateComponent = StarRateComponent()
        rateComponent.translatesAutoresizingMaskIntoConstraints = false
        return rateComponent
    }()
    
    lazy var buttonsContainerView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .Color100?.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonsStackContainerView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .Color100?.withAlphaComponent(0.8)
        container.axis = .horizontal
        container.spacing = 10
        container.distribution = .fillEqually
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    lazy var subscribeButton: CustomButton = {
        let button = CustomButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .subscribeButton
        button.setTitle("Suscribete", for: .normal)
        return button
    }()
    
    lazy var voteButton: CustomButton = {
        let button = CustomButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .voteButton
        button.setTitle("Vota por tu favorita", for: .normal)
        return button
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.bounces = true
        scroll.delaysContentTouches = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let containerView: UIStackView = {
        let container = UIStackView()
        container.backgroundColor = .Color200
        container.axis = .vertical
        container.spacing = 5
        container.distribution = .fill
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }
    
    func setupComponents() {
        backgroundColor = .Color300
        addComponents()
        setMovieViewLayout()
    }
    
    func addComponents() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        imagesContainerView.addSubview(movieBackView)
        imagesContainerView.addSubview(movieImageView)
        containerView.addArrangedSubview(imagesContainerView)
        containerView.addArrangedSubview(movieNameLabel)
        containerView.addArrangedSubview(rateContainerView)
        rateContainerView.addSubview(rateComponent)
        containerView.addArrangedSubview(movieDateLabel)
        containerView.addArrangedSubview(descriptionContainerView)
        descriptionContainerView.addSubview(movieDescriptionLabel)
        buttonsContainerView.addSubview(buttonsStackContainerView)
        buttonsStackContainerView.addArrangedSubview(voteButton)
        buttonsStackContainerView.addArrangedSubview(subscribeButton)

        containerView.addArrangedSubview(buttonsContainerView)
        addSubview(loadingView)
    }
    
    func setMovieViewLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            imagesContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imagesContainerView.heightAnchor.constraint(equalToConstant: 250),
            
            movieBackView.widthAnchor.constraint(equalTo: imagesContainerView.widthAnchor),
            movieBackView.heightAnchor.constraint(equalToConstant: 250),
            
            movieImageView.topAnchor.constraint(equalTo: movieBackView.topAnchor, constant: 10),
            movieImageView.bottomAnchor.constraint(equalTo: movieBackView.bottomAnchor, constant: -10),
            movieImageView.leadingAnchor.constraint(equalTo: movieBackView.leadingAnchor, constant: 6),
            movieImageView.widthAnchor.constraint(equalTo: imagesContainerView.widthAnchor, multiplier: 0.30),
            movieNameLabel.heightAnchor.constraint(equalToConstant: 80),
            
            movieDescriptionLabel.topAnchor.constraint(equalTo: descriptionContainerView.topAnchor, constant: 10),
            movieDescriptionLabel.bottomAnchor.constraint(equalTo: descriptionContainerView.bottomAnchor, constant: -10),
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainerView.leadingAnchor, constant: 10),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainerView.trailingAnchor, constant: -10),
            movieDateLabel.heightAnchor.constraint(equalToConstant: 50),
            rateContainerView.heightAnchor.constraint(equalToConstant: 50),
            rateComponent.centerXAnchor.constraint(equalTo: rateContainerView.centerXAnchor),
            rateComponent.centerYAnchor.constraint(equalTo: rateContainerView.centerYAnchor),
            rateComponent.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.4),
            buttonsStackContainerView.heightAnchor.constraint(equalToConstant: 50),
            buttonsStackContainerView.leadingAnchor.constraint(equalTo: buttonsContainerView.leadingAnchor, constant: 5),
            buttonsStackContainerView.trailingAnchor.constraint(equalTo: buttonsContainerView.trailingAnchor, constant: -5),
            
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setMovieViewDetail(movie: Movie) {
        movieBackView.imageFromUrl(urlImage: movie.backdropPath, defaultImage: (UIImage(named: "corte-verde")?.withRenderingMode(.alwaysTemplate))!)
        movieBackView.tintColor = .Color200
        movieImageView.imageFromUrl(urlImage: movie.posterPath, defaultImage: (UIImage(named: "corte-verde")?.withRenderingMode(.alwaysTemplate))!)
        movieImageView.tintColor = .Color200
        movieNameLabel.text = movie.title
        rateComponent.setRating(to: movie.voteAverage)
        let releaseDate = DateFormatter.stringDateToDate.date(from: movie.releaseDate)
        movieDateLabel.text = DateFormatter.explicitDateFormatter.string(from: releaseDate ?? Date())
        movieDescriptionLabel.text = movie.overview
    }
}
