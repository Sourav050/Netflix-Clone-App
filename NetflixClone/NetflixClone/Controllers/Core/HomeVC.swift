//
//  HomeVC.swift
//  NetflixClone
//
//  Created by Sourav Choubey on 01/02/24.
//

import UIKit

enum Sections : Int {
    case TrendingMovies = 0
    case TrendingTvs = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeVC: UIViewController {
    let sectionTitles : [String] = [
        
         "Trending Movies", "Trending TV", "Popular", "Upcoming Movies", "Top Rated"
        
    ]
    
    //Declaring TableView
    private let homeFeedTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)          //table with header height of 40px
        table.register(CollectionViewTVC.self, forCellReuseIdentifier: CollectionViewTVC.identifier)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)                      //adding table view to view
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        let headerView = HeroHeaderUV(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
   
    private func configureNavbar() {
        
        var logoImage = UIImage(named: "NetflixLogo")
        logoImage = logoImage?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .done, target: self, action: nil)
        
        //        let logoButton = UIButton(type: .custom)
        //        logoButton.setImage(logoImage, for: .normal)
        //        logoButton.addTarget(self, action: nil, for: .touchUpInside)
        //        let logoBarButton = UIBarButtonItem(customView: logoButton)
        //
        //        // Set the left bar button item
        //        navigationItem.leftBarButtonItem = logoBarButton
        
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
}


extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTVC.identifier, for: indexPath) as? CollectionViewTVC else{
            return UITableViewCell()
        }
//        cell.configure(with: )
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue :
            ApiCaller.shared.getTrendingMovies {
                result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TrendingTvs.rawValue :
            ApiCaller.shared.getTrendingTVs {
                result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Popular.rawValue :
            
            ApiCaller.shared.getPopular{
                result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
        case Sections.Upcoming.rawValue :
            ApiCaller.shared.getUpcomingMovies {
                result in
                switch result{
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Sections.TopRated.rawValue :
            ApiCaller.shared.getTopRated {
                result in
                switch result{
                case .success(let titles) :
                    cell.configure(with: titles)
                case .failure(let error) :
                    print(error.localizedDescription)
                }
            }
            
        default:
            return UITableViewCell()
            
        }
        return cell
    }
    
    //height of each cell section
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // height for header section to name the category
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultoffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultoffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y + 20, width: 100, height: header.bounds.height)
        
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
}
