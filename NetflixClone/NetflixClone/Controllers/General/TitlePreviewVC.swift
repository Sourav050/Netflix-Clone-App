////
////  TitlePreviewVC.swift
////  NetflixClone
////
////  Created by Sourav Choubey on 05/02/24.
////
//
//import UIKit
//
//import WebKit
//
//class TitlePreviewVC: UIViewController {
//    
//    private let label : UILabel =  {
//        
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 22, weight: .bold)
//        
//        return label
//         
//    }()
//    
//    private let overviewLabel : UILabel = {
//        let label = UILabel()
//        label.font = .systemFont(ofSize: 18, weight: .regular)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        
//        return label
//    }()
//    
//    
//    private let downloadButton : UIButton = {
//        let button = UIButton()
//        
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemRed
//        button.setTitle("Download", for: .normal)
//        
//        button.setTitleColor(.white, for: .normal)
//        
//        
//        return button
//    }()
//    
//    private let webView : WKWebView = WKWebView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.addSubview(webView)
//        view.addSubview(label)
//        view.addSubview(overviewLabel)
//        view.addSubview(downloadButton)
//        
//        configureConstraints()
//
//    }
//    
//    
//    private func configureConstraints() {
//        let webViewConstraints = [
//            webView.topAnchor.constraint(equalTo: view.topAnchor),
//            webView.leadingAnchor.constraint(equalTo:  view.leadingAnchor),
//            webView.trailingAnchor.constraint(equalTo:  view.trailingAnchor),
////            webView.heightAnchor.constraint(equalToConstant: 250)
//        ]
//        
//        let titlelabelConstraints = [
//            label.
//        ]
//        
//        NSLayoutConstraint.activate(webViewConstraints)
//    }
//
//
//}
