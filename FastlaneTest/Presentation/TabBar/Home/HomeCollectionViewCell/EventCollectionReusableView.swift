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
        $0.font = .systemFont(ofSize: 40)
        $0.text = "흠.."
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        [label].forEach { self.addSubview($0) }
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        label.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    
}
