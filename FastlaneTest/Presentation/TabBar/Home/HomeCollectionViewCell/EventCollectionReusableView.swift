//
//  EventCollectionReusableView.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/27.
//

import UIKit

import SnapKit
import Then

final class EventCollectionReusableView: UICollectionReusableView {
    
    let label = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.text = "흠.."
    }
    
    let underLine = UIView().then {
        $0.backgroundColor = .black
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        [label, underLine].forEach { self.addSubview($0) }
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        label.snp.makeConstraints {
            $0.bottom.equalTo(self).inset(16)
            $0.leading.equalTo(20)
        }
        
        underLine.snp.makeConstraints {
            $0.width.equalTo(self)
            $0.height.equalTo(1.5)
            $0.bottom.equalTo(self)
        }
    }
    
    
}
