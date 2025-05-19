//
//  Section1TableViewHeader.swift
//  bcsd8week
//
//  Created by 김성민 on 5/15/25.
//

import UIKit

class Section1TableViewHeader: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "일반"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "FAFAFA")
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.leading.equalTo(self.snp.leading).offset(24)
            $0.centerY.equalTo(self.snp.centerY)
        }
    }
    
}
