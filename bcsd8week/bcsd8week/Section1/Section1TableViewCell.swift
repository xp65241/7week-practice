//
//  Section1TableViewCell.swift
//  bcsd8week
//
//  Created by 김성민 on 5/15/25.
//

import UIKit

class Section1TableViewCell: UITableViewCell {
    
    static let identifier = "Section1TableViewCell"
    
    
    private let defaultLabel: UILabel = {
        let label = UILabel()
        label.text = "dummy"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Medium", size: 16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.separatorInset = .zero
        self.layoutMargins = .zero
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension Section1TableViewCell {
    private func setupUI(){
        contentView.addSubview(defaultLabel)
        defaultLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(24)
            $0.centerY.equalTo(contentView.snp.centerY)
        }
    }
    public func configure(text: String){
        defaultLabel.text = text
    }
    
}
