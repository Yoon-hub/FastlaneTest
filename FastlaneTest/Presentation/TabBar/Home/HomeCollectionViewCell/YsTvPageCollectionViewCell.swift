//
//  CollectionViewCell.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/28.
//

import UIKit

import SnapKit
import Then

class YsTvPageCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView().then {
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleToFill
    }
    
    let descriptLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .ysblack
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView, descriptLabel].forEach { self.addSubview($0) }
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self)
            $0.bottom.equalTo(self).inset(10)
        }
        
        descriptLabel.snp.makeConstraints {
            $0.horizontalEdges.equalTo(self)
            $0.top.equalTo(imageView.snp.bottom).offset(1)
        }
    }
    
    
    func bind(item: YsTvList) {
        let url = URL(string: item.tvFullImgURL)!
        //imageView.kf.setImage(with: url)
        imageView.load(url: url)
        descriptLabel.text = item.tvNameMain
    }
    
    
    
}
