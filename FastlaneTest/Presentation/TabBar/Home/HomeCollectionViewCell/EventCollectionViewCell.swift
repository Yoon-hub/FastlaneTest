//
//  EventCollectionViewCell.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import UIKit

import Then
import SnapKit

import Kingfisher

final class EventCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
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
    

    func bind(item2: EventList) {
        let url = URL(string: item2.thumbnailImageURL)
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "image"))
        //imageView.load(url: url!)
    }
    
    
}
