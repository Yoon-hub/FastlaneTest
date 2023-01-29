//
//  DetailVIew.swift
//  FastlaneTest
//
//  Created by 최윤제 on 2023/01/29.
//

import UIKit

import SnapKit
import Then

final class DetailView: BaseView {
    
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    let thumnailImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
    let customerImage = UIImageView().then {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 22
        $0.layer.borderColor = UIColor.ysGray3.cgColor
        $0.layer.borderWidth = 1
        $0.image = UIImage(named: "se")
        $0.contentMode = .scaleToFill
    }
    
    let customerNameLabel = UILabel().then {
        $0.textColor = .ysblack
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .ysGray6
    }
    
    let reservationButton = UIButton().then {
        $0.setTitleColor(.fastlanePink, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .heavy)
        $0.setTitle("모바일예약", for: .normal)
    }
    
    let nameLabel = UILabel().then {
        $0.textColor = .ysblack
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    let descriptLabel = UILabel().then {
        $0.numberOfLines = 3
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .ysGray7
    }
    
    let pricelabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 22, weight: .bold)
    }
    
    let oneLabel = UILabel().then {
        $0.textColor = .ysblack
        $0.font = .systemFont(ofSize: 12)
        $0.text = "(VAT 포함)"
    }
    
    let button1 = UIButton().then {
        $0.setImage(UIImage(named: "notice"), for: .normal)
    }
    
    let button2 = UIButton().then {
        $0.setImage(UIImage(named: "more"), for: .normal)
    }
    
    let registButton = UIButton().then {
        $0.layer.cornerRadius = 4
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.setTitle("회원가입하고 11,000원 할인받기", for: .normal)
        $0.setTitleColor(.fastlanePink, for: .normal)
        $0.layer.borderColor = UIColor.fastlanePink.cgColor
        $0.layer.borderWidth = 1
    }
    
    
    override func configure() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [thumnailImageView, customerImage, customerNameLabel, locationLabel, reservationButton, nameLabel, descriptLabel, pricelabel, oneLabel, button1, button2, registButton].forEach { contentView.addSubview($0)}
    }
    
    override func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    
        
        contentView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(scrollView.contentLayoutGuide)
            $0.bottom.equalTo(scrollView.contentLayoutGuide).inset(20)
            $0.width.equalTo(scrollView)
            $0.height.equalTo(1000)
        }
        thumnailImageView.snp.makeConstraints {
            $0.horizontalEdges.top.equalTo(contentView)
            $0.height.equalTo(350)
        }
        
        customerImage.snp.makeConstraints {
            $0.top.equalTo(thumnailImageView.snp.bottom).offset(24)
            $0.leading.equalTo(contentView).inset(16)
            $0.width.height.equalTo(44)
        }
        
        customerNameLabel.snp.makeConstraints {
            $0.top.equalTo(thumnailImageView.snp.bottom).offset(28)
            $0.leading.equalTo(customerImage.snp.trailing).offset(8)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(customerNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(customerImage.snp.trailing).offset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(32)
            $0.leading.equalTo(contentView).inset(16)
        }
        
        descriptLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(contentView).inset(16)
        }
        
        reservationButton.snp.makeConstraints {
            $0.top.equalTo(descriptLabel.snp.bottom).offset(12)
            $0.trailing.equalTo(contentView).inset(16)
        }
        
        pricelabel.snp.makeConstraints {
            $0.top.equalTo(reservationButton.snp.bottom).offset(16)
            $0.leading.equalTo(contentView).inset(16)
        }
        
        oneLabel.snp.makeConstraints {
            $0.top.equalTo(pricelabel)
            $0.leading.equalTo(pricelabel.snp.trailing).offset(2)
        }
        
        button1.snp.makeConstraints {
            $0.trailing.equalTo(contentView).inset(16)
            $0.centerY.equalTo(pricelabel)
        }
        
        button2.snp.makeConstraints {
            $0.trailing.equalTo(button1.snp.leading).offset(-16)
            $0.centerY.equalTo(pricelabel)
        }
        
        registButton.snp.makeConstraints {
            $0.top.equalTo(pricelabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalTo(contentView).inset(16)
            $0.height.equalTo(44)
        }
        
    }
}
