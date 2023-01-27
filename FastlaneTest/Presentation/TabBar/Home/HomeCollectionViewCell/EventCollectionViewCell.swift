//
//  EventCollectionViewCell.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import UIKit

import Then
import SnapKit

final class EventCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView].forEach { self.addSubview($0) }
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        imageView.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.height.width.equalTo(70)
            $0.leading.equalTo(self).inset(8)
        }
    }
    
    func bind(item: YsTvList) {
        let url = URL(string: item.tvFullImgURL)
        imageView.load(url: url!)
    }
    
    func bind(item2: EventList) {
        let url = URL(string: item2.thumbnailImageURL)
        imageView.load(url: url!)
    }
    
    
}
