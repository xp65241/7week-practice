//
//  Section2TableViewHeader.swift
//  bcsd8week
//
//  Created by 김성민 on 5/15/25.
//

import UIKit
import SnapKit

class Section2TableViewHeader: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-medium", size: 14)
        label.textColor = .black
        label.text = "서비스"
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
