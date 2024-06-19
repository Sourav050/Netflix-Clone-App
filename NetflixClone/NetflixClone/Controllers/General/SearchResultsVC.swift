//
//  SearchResultsVC.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 04/02/24.
//

import UIKit

class SearchResultsVC: UIViewController {
    
    public var titles : [Title] = [Title]()
    
    
    public let searchResultsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 5, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.register(TitleCVC.self, forCellWithReuseIdentifier: TitleCVC.identifier)
        
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(searchResultsCollectionView)
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
    
}

extension SearchResultsVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCVC.identifier, for: indexPath) as? TitleCVC else {return UICollectionViewCell()}
        let title = titles[indexPath.row]
        cell.configure(with: title.poster_path ?? "Unknow URL")
        return cell
    }
    
    
}
