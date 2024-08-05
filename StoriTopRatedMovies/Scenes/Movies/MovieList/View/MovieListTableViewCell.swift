//
//  MovieListTableViewCell.swift
//  StoriTopRatedMovies
//
//  Created by ozkr on 02/08/24.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    private lazy var cellContainer: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.layer.cornerRadius = 10.0
        view.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        view.layer.shadowRadius = 2.0
        view.layer.shadowColor = UIColor.Color900?.cgColor
        view.layer.shadowOpacity = 0.5
        view.backgroundColor = .Color100
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var resumeView: UIView = {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .Color100?.withAlphaComponent(0.8)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10.0
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    internal lazy var movieNameLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Bold(size: 16)
        label.textColor = .Color900
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    internal lazy var movieReleaseDateLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = CustomFonts.Font.Regular(size: 16)
        label.textColor = .Color800
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    internal lazy var rateComponent: StarRateComponent = {
        let uiView = StarRateComponent()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private var movieImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10.0
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Inicializa layout de cell
        self.backgroundColor = .Color300
        setupCellViews()
        setCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellViews(){
        addSubview(cellContainer)
        cellContainer.addSubview(movieImageView)
        cellContainer.addSubview(resumeView)
        resumeView.addSubview(movieNameLabel)
        resumeView.addSubview(movieReleaseDateLabel)
        resumeView.addSubview(rateComponent)
    }
    
    func setCellLayout(){
        NSLayoutConstraint.activate([
                        
            cellContainer.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            cellContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            cellContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            cellContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            movieImageView.topAnchor.constraint(equalTo: cellContainer.topAnchor, constant: 8),
            movieImageView.leadingAnchor.constraint(equalTo: cellContainer.leadingAnchor, constant: 8),
            movieImageView.widthAnchor.constraint(equalTo: cellContainer.widthAnchor, multiplier: 0.25),
            movieImageView.bottomAnchor.constraint(equalTo: cellContainer.bottomAnchor, constant: -8),

            resumeView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 8),
            resumeView.topAnchor.constraint(equalTo: cellContainer.topAnchor, constant: 8),
            resumeView.trailingAnchor.constraint(equalTo: cellContainer.trailingAnchor, constant: -8),
            resumeView.bottomAnchor.constraint(equalTo: cellContainer.bottomAnchor, constant: -8),
                       
            movieNameLabel.topAnchor.constraint(equalTo: resumeView.topAnchor, constant: 8),
            movieNameLabel.leadingAnchor.constraint(equalTo: resumeView.leadingAnchor, constant: 8),
            movieNameLabel.trailingAnchor.constraint(equalTo: resumeView.trailingAnchor, constant: -8),
            
            movieReleaseDateLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 16),
            movieReleaseDateLabel.centerXAnchor.constraint(equalTo: resumeView.centerXAnchor),
            
            rateComponent.topAnchor.constraint(equalTo: movieReleaseDateLabel.topAnchor, constant: 30),
            rateComponent.centerXAnchor.constraint(equalTo: resumeView.centerXAnchor)
        ])
    }
    
    func setupCellData(movie: Movie){
        movieImageView.imageFromUrl(urlImage: movie.posterPath, defaultImage: (UIImage(named: "corte-verde")?.withRenderingMode(.alwaysTemplate))!)
        movieImageView.tintColor = .Color200
        movieNameLabel.text = movie.title
        let releaseDate = DateFormatter.stringDateToDate.date(from: movie.releaseDate)
        movieReleaseDateLabel.text = DateFormatter.explicitDateFormatter.string(from: releaseDate ?? Date())
        rateComponent.setRating(to: movie.voteAverage)
    }
}
