//
//  YsTvCollectionViewCell.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import UIKit

import RxSwift
import SnapKit
import Then

final class YsTvCollectionViewCell: UICollectionViewCell {
    
    var cellDisposeBag = DisposeBag()
    
    let ysCollcetionView = {
        let layout =  UICollectionViewFlowLayout()
        let spacing : CGFloat = 4
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: width / 2.5 , height: 100)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 0)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.register(YsTvPageCollectionViewCell.self, forCellWithReuseIdentifier: YsTvPageCollectionViewCell.reusable)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(ysCollcetionView)
        
        ysCollcetionView.snp.makeConstraints {
            $0.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellDisposeBag = DisposeBag()
    }
    
    

    
}
