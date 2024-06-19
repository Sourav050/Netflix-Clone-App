//
//  HeroHeaderUV.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 02/02/24.
//

import UIKit
//UICollectionReusableView
class HeroHeaderUV: UIView {
    
    
    private let downloadButton : UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        return button
        
    }()
    
    private let playButton : UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        
        return button
        
    }()
    
    //closure for the herImageView
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "HeroImage")
        
        return imageView
    }()
    
    //adding a gradient to look more nice
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors =  [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds // always remember to provide a frame
        layer.addSublayer(gradientLayer)
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView) // always add subview which i usually forget
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
            
    }
    
    private func applyConstraints() {
        
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds //adding frame to the layout subview
    }
    
}

