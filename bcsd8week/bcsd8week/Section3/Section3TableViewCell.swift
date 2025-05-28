//
//  Section3TableViewCell.swift
//  bcsd8week
//
//  Created by 김성민 on 5/15/25.
//

import UIKit
import SnapKit
class Section3TableViewCell: UITableViewCell {

    
    static let identifier = "Section3TableViewCell"
    
    
    private let defaultLabel: UILabel = {
        let label = UILabel()
        label.text = "dummy"
        label.textColor = .black
        label.textAlignment = .center
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


extension Section3TableViewCell {
    private func setupUI(){
        contentView.addSubview(defaultLabel)
        
        defaultLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    public func configureSection3(text: String){
        defaultLabel.text = text
    }
}

