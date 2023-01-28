//
//  YsTvCollectionReusableView.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/28.
//

import UIKit

import SnapKit
import Then

final class YsTvCollectionReusableView: UICollectionReusableView {
    
    let title = UILabel().then {
        $0.text = "여신TV 인기영상"
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    
    let moreButton = UIButton().then {
        $0.titleLabel?.font = .systemFont(ofSize: 11)
        $0.setTitleColor(.ysGray6, for: .normal)
        $0.setTitle("더보기", for: .normal)
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        [title, moreButton].forEach { self.addSubview($0) }
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        
        title.snp.makeConstraints {
            $0.bottom.equalTo(self).inset(16)
            $0.leading.equalTo(20)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(title)
            $0.trailing.equalTo(self).inset(16)
        }
        
    }
    
    
}
