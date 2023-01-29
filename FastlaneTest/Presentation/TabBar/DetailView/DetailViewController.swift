//
//  DetailViewController.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/29.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let detailView = DetailView()
    
    var data: EventList!
    
    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setting()
        navigationSetting()
    }
    
}

//MARK: set
extension DetailViewController {
    private func navigationSetting() {
        navigationController?.navigationBar.tintColor = .fastlanePink
        navigationController?.navigationBar.topItem?.title = ""
        
        let rigthBarButton = UIBarButtonItem(image: UIImage(named: "shop"), style: .plain, target: self, action: #selector(rightBarButtonClicked))
        navigationItem.rightBarButtonItem = rigthBarButton
    }
    
    @objc func rightBarButtonClicked() {
        present(showAlert(message: "새해 복 많이받으세요❤️"), animated: true)
    }
    
    private func setting() {
        let url = URL(string: data.thumbnailImageURL)!
        detailView.thumnailImageView.load(url: url)
        detailView.customerNameLabel.text = data.customerName
        detailView.locationLabel.text = data.displayName
        detailView.nameLabel.text = data.name
        detailView.descriptLabel.text = data.comment
    
        detailView.pricelabel.text = "\(numberFormat(value: data.price))원"
    }
}
