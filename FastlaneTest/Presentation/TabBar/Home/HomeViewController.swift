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
        collectionViewHeader()
        collectionViewBind()
        collectionViewItemSelected()
        viewModel.requestYsData()
    }

}



//MARK: - CollcetionView
extension HomeViewController {
    
    private func setDataSource() {
        dataSource = RxCollectionViewSectionedReloadDataSource<SectionYsData>(configureCell: { dataSource, collectionView, indexPath, item in
            switch item {
            case .tvList(let tvList):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YsTvCollectionViewCell.reusable, for: indexPath) as! YsTvCollectionViewCell
                let ysData = Observable.of(tvList.ysTvList)
                ysData.bind(to: cell.ysCollcetionView.rx.items(cellIdentifier: YsTvPageCollectionViewCell.reusable, cellType: YsTvPageCollectionViewCell.self))
                { index, ysData, cell in
                    cell.bind(item: ysData)
                }
                .disposed(by: cell.cellDisposeBag)
                
                cell.ysCollcetionView.rx.itemSelected
                    .withUnretained(self)
                    .bind { vc, index in
                        let webView = WebViewController()
                        webView.url = tvList.ysTvList[index.item].tvVideoURL
                        vc.transition(webView, transitionStyle: .naviagtion)
                    }
                    .disposed(by: cell.cellDisposeBag)
                
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
    
    private func collectionViewItemSelected() {
        homeView.homeCollectionView.rx.itemSelected
            .withUnretained(self)
            .bind {(vc, index) in

                let detailVC = DetailViewController()
                if index.section == 1 {
                    detailVC.data = vc.viewModel.newEvent[index.item]
                } else if index.section == 2 {
                    detailVC.data = vc.viewModel.recommentEvent[index.item]
                }
                vc.transition(detailVC, transitionStyle: .naviagtion)
            }
            .disposed(by: disposeBag)
    }
    
    private func collectionViewBind() {
        viewModel.ysInfo
            .bind(to: homeView.homeCollectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func collectionViewHeader() {
        dataSource.configureSupplementaryView = {(dataSource, collectionView, kind, indexPath) -> UICollectionReusableView in
            
            if indexPath.section == 0 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: YsTvCollectionReusableView.reusable, for: indexPath) as! YsTvCollectionReusableView
                
                return header
            } else {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EventCollectionReusableView.reusable, for: indexPath) as! EventCollectionReusableView
                
                let text = dataSource.sectionModels[indexPath.section].header
                let attributeString = NSMutableAttributedString(string: text)
                attributeString.addAttribute(.foregroundColor, value: UIColor.fastlanePink, range: (text as NSString).range(of: "이벤트"))
                header.label.attributedText = attributeString
                return header
            }
        }
    }

}

	



