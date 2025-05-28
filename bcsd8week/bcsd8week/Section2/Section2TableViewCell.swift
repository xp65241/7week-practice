//
//  Section2TableViewCell.swift
//  bcsd8week
//
//  Created by 김성민 on 5/15/25.
//

import UIKit

class Section2TableViewCell: UITableViewCell {

    static let identifier = "Section2TableViewCell"

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

extension Section2TableViewCell {
    private func setupUI(){
        contentView.addSubview(defaultLabel)
        defaultLabel.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(24)
            $0.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    public func configureSection2(text: String){
        defaultLabel.text = text
    }
    
}

