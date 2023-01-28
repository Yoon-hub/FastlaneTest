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
    //120
    let imageView = UIImageView().then {
        $0.layer.cornerRadius = 12
        $0.layer.masksToBounds = true
        $0.contentMode = .scaleToFill
    }
    
    let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .ysGray7
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    let commentLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .ysGray6
        $0.numberOfLines = 2
    }
    
    let underLine = UIView().then {
        $0.backgroundColor = .ysGray1
    }
    
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .heavy)
        $0.textColor = .fastlanePink
    }
    
    let wonLabel = UILabel().then {
        $0.text = "만원"
        $0.textColor = .fastlanePink
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    
    let reservationButton = UIButton().then {
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        $0.layer.cornerRadius = 8
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("모바일예약", for: .normal)
        $0.backgroundColor = .fastlanePink
    }
    
    let interestLabel = UILabel().then {
        $0.text = "관심도"
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .ysGray6
    }
    
    let interestNum = UILabel().then {
        $0.textColor = .fastlanePink
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    let reviewLabel = UILabel().then {
        $0.text = "리뷰"
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .ysGray6
    }
    
    let reviewNum = UILabel().then {
        $0.textColor = .fastlanePink
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    let starLabel  = UILabel().then {
        $0.text = "★"
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = .ysGray6
    }
    
    let starNum = UILabel().then {
        $0.text = "9.7"
        $0.textColor = .fastlanePink
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [imageView, underLine, locationLabel, nameLabel, commentLabel, reservationButton, priceLabel, wonLabel, interestLabel, reviewLabel, starLabel, interestNum, reviewNum, starNum].forEach { self.addSubview($0) }
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        imageView.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(self).inset(12)
            $0.width.equalTo(imageView.snp.height)
        }
        
        underLine.snp.makeConstraints {
            $0.leading.trailing.equalTo(self).inset(8)
            $0.height.equalTo(1)
            $0.bottom.equalTo(self)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(self).inset(14)
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(4)
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.trailing.equalTo(self).inset(40)
        }
        
        reservationButton.snp.makeConstraints {
            $0.top.equalTo(self).inset(14)
            $0.trailing.equalTo(self).inset(16)
            $0.width.equalTo(62)
            $0.height.equalTo(17)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.bottom.equalTo(self).inset(12)
            
        }
        
        wonLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(1)
        }
            
        interestLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel).offset(6)
            $0.trailing.equalTo(self).inset(128)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel).offset(6)
            $0.leading.equalTo(interestLabel.snp.trailing).offset(34)
        }
        
        starLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel).offset(6)
            $0.leading.equalTo(reviewLabel.snp.trailing).offset(30)
        }
        
        interestNum.snp.makeConstraints {
            $0.top.equalTo(interestLabel)
            $0.leading.equalTo(interestLabel.snp.trailing).offset(1)
        }
        
        reviewNum.snp.makeConstraints {
            $0.top.equalTo(interestLabel)
            $0.leading.equalTo(reviewLabel.snp.trailing).offset(1)
        }
        
        starNum.snp.makeConstraints {
            $0.top.equalTo(interestLabel)
            $0.leading.equalTo(starLabel.snp.trailing).offset(1)
        }
    
    }
    

    func bind(item2: EventList) {
        let url = URL(string: item2.thumbnailImageURL)
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "image"))
        //imageView.load(url: url!)
        locationLabel.text = item2.displayName
        nameLabel.text = item2.name
        commentLabel.text = item2.comment
        priceLabel.text = checkPrice(text: item2.price)
        interestNum.text = checkReview(item2.wishCount)
        reviewNum.text = checkReview(item2.reviewCount)
    }
    
    private func checkPrice(text: Int) -> String {
        let tenThousand = text / 10000
        let thousand = (text % 10000) / 1000
        
        return thousand == 0 ? "\(tenThousand)" : "\(tenThousand).\(thousand)"
    }
    
    private func checkReview(_ num: Int) -> String {
        if num < 10 { return "\(num)+" }
        else if num < 100 { return "\(num / 10)0+" }
        else if num < 1000 { return "\(num / 100)백+" }
        else if num < 10000 { return "\(num / 1000)천+" }
        else { return "\(num / 10000)만+" }
    }
    
    
}
