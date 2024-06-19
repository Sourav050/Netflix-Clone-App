//
//  TitleTVC.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 03/02/24.
//

import UIKit

class TitleTVC: UITableViewCell {

    static let identifier = "TitleTVC"
    
    
    private let playtitleButton : UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
          
    }()
    
    
    private let titleLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let titleposterUIImageView : UIImageView  = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleposterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playtitleButton)
        
        
        applyconstraints()
        
    }
    
    
    private func applyconstraints() {
        
        let titleposterUIImageViewConstraints = [
            titleposterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleposterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  10),
            titleposterUIImageView.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor, constant: -10),
            titleposterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titleposterUIImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ]
        
        
        let playtitleButtonConstraints = [
            playtitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playtitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(titleposterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playtitleButtonConstraints)
        
    }
    
    
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else { return }
        titleposterUIImageView.sd_setImage(with: url, completed: nil)
 
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
