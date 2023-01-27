//
//  HomeViewController.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/26.
//

import UIKit

import RxDataSources
import RxSwift

final class HomeViewController: UIViewController {
    
    private let homeView = HomeView()
    
    private let viewModel = HomeViewModel()
    
    private var dataSource: RxCollectionViewSectionedReloadDataSource<SectionYsData>!
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setDataSource()
        collectionViewBind()
        viewModel.requestYsData()
    }

}

//MARK: - CollcetionView
extension HomeViewController {
    
    private func setDataSource() {
        dataSource = RxCollectionViewSectionedReloadDataSource<SectionYsData>(configureCell: { dataSource, collectionView, indexPath, item in
      
            switch item {
            case .tvList(let tvList):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reusable, for: indexPath) as! EventCollectionViewCell
                cell.bind(item: tvList)
                return cell
            case .recommendEvent(let recommendEvent):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reusable, for: indexPath) as! EventCollectionViewCell
                cell.bind(item2: recommendEvent)
                return cell
            case .newEvent(let newEvent):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.reusable, for: indexPath) as! EventCollectionViewCell
                cell.bind(item2: newEvent)
                return cell
            }
        })
    }
    
    private func collectionViewBind() {
        viewModel.ysInfo
            .bind(to: homeView.homeCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    

}
