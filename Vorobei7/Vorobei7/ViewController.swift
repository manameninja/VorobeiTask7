//
//  ViewController.swift
//  Vorobei7
//
//  Created by Даниил Павленко on 21.04.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Image"))
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.frame = view.frame
        scroll.contentSize = CGSize(width: view.frame.width, height: 1000)
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: -scrollView.safeAreaInsets.top, width: scrollView.frame.width, height: 300)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top
        if y < 0 {
            imageView.frame = CGRect(x: 0, y: -scrollView.safeAreaInsets.top + y, width: scrollView.frame.width, height: 300 - y)
            
        }
        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.height - scrollView.safeAreaInsets.top
    }
}
