//
//  CampusFacilityCollectionViewCell.swift
//  coin
//
//  Created by 김성민 on 5/12/25.
//

import UIKit
import SnapKit

class CampusFacilityCollectionViewCell: UICollectionViewCell {
    static let identifier = "facilityCell"
    

    private let iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = UIImage(systemName: "questionmark")!
        iconImageView.tintColor = .label
        return iconImageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.text = "???"
        return label
    }()
    private let weekdayHours: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13 , weight: .regular)
        label.textColor = .label
        label.text = "평일 : "
        return label
    }()
    
    private let weekendHours: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13 , weight: .regular)
        label.textColor = .systemBlue
        label.text = "토요일 : "
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(weekdayHours)
        contentView.addSubview(weekendHours)
        
        contentView.backgroundColor = .systemGray6
        
        
        contentView.layer.cornerRadius = 10
        
        
        iconImageView.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(16)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.width.height.equalTo(40)
        }
        
        mainLabel.snp.makeConstraints {
            $0.bottom.equalTo(weekdayHours.snp.top).offset(-1)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(20)
        }
        
        weekdayHours.snp.makeConstraints {
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(20)
        }
        
        weekendHours.snp.makeConstraints {
            $0.top.equalTo(weekdayHours.snp.bottom).offset(1)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(20)
        }
    }
    
    public func configure(image: UIImage , mainLabelText: String ,weekText: String , weekendText: String){
        iconImageView.image = image
        mainLabel.text = mainLabelText
        weekdayHours.text = "평일 : \(weekText)"
        weekendHours.text = "주말: \(weekendText)"
    }
    
    
}
