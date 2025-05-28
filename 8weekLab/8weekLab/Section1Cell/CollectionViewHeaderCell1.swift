//
//  CollectionViewHeaderCell.swift
//  8weekLab
//
//  Created by 김성민 on 5/25/25.
//

import UIKit
import UIKit

class CollectionViewHeaderCell1: UICollectionReusableView {
    static let identifier = "CollectionViewHeaderCell"
    var itemRow: Int?
    
    private let label1: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textAlignment = .center
        return label
    }()
    private let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let label3: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#CACACA")
        return view
    }()
    
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#CACACA")
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout(){
        self.addSubview(label1)
        self.addSubview(label2)
        self.addSubview(label3)
        self.addSubview(topSeparatorView)
        self.addSubview(bottomSeparatorView)
        self.backgroundColor = UIColor(named: "#FAFAFA")
        
        label2.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(1.0 / 3.0)
            $0.centerX.equalToSuperview()
        }
        
        label1.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(1.0 / 3.0)
        }
        
        label3.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(1.0 / 3.0)
        }
        
        topSeparatorView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        bottomSeparatorView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
    }
    
    
    func configureHeader(with header: HeaderModel){
        label1.text = header.data1
        label2.text = header.data2
        label3.text = header.data3
    }
    
    
    
    
    
}
