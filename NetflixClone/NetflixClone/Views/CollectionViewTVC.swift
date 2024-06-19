//
//  CollectionViewTVC.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 01/02/24.
//

import UIKit

class CollectionViewTVC: UITableViewCell {
    

    static let identifier = "CollectionViewTVC"
    private var titles : [Title] = [Title]()
    
    private let collectionView :UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(TitleCVC.self, forCellWithReuseIdentifier:TitleCVC.identifier )
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGray
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with titles : [Title]){
        self.titles = titles
        DispatchQueue.main.async {
            [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}



extension CollectionViewTVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCVC.identifier, for: indexPath) as? TitleCVC else {
                    return UICollectionViewCell()
                }
        
        guard let model = titles[indexPath.row].poster_path else {return UICollectionViewCell() }
        cell.configure(with: model)
        

        return cell
    }
    
    
}
