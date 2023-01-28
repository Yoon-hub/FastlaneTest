//
//  HomeView.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/26.
//

import UIKit

import SnapKit
import Then

final class HomeView: BaseView {
    
    let imageView = UIImageView().then {
        $0.tintColor = .red
        $0.layer.cornerRadius = 20
        $0.image = UIImage(named: "women")
    }
    
    let textField = UITextField().then {
        $0.font = .systemFont(ofSize: 13)
        $0.placeholder = "피부시술을 검색해 보세요 :)"
    }
    
    let searchButton = UIButton().then {
        $0.tintColor = .fastlanePink
        $0.setImage(UIImage(named: "search"), for: .normal)
    }
    
    let underLine = UIView().then {
        $0.backgroundColor = .fastlanePink
    }
    
    let homeCollectionView = {
        let layout =  UICollectionViewFlowLayout()
        let spacing : CGFloat = 4
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width, height: 120)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.headerReferenceSize = .init(width: width, height: 90)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.reusable)
        view.register(YsTvCollectionViewCell.self, forCellWithReuseIdentifier: YsTvCollectionViewCell.reusable)
        view.register(EventCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: EventCollectionReusableView.reusable)
        view.register(YsTvCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: YsTvCollectionReusableView.reusable)
        view.backgroundColor = .white
        return view
    }()
    
    override func configure() {
        [imageView, textField, searchButton, underLine, homeCollectionView].forEach { self.addSubview($0) }
    }
    
    override func setConstraints() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(8)
            $0.width.height.equalTo(40)
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.centerY.equalTo(imageView)
            $0.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(textField)
            $0.width.height.equalTo(20)
            $0.trailing.equalTo(textField.snp.trailing).inset(8)
        }
        
        underLine.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.top.equalTo(textField.snp.bottom).offset(8)
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).inset(8)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(underLine.snp.bottom).offset(2)
        }
    }

}
