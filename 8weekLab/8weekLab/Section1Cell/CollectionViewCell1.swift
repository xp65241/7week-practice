//
//  CollectionViewCell.swift
//  8weekLab
//
//  Created by 김성민 on 5/24/25.
//

import UIKit
import SnapKit

class CollectionViewCell1: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    var itemRow: Int?

    
    let cellName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        return label
    }()
    
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#E1E1E1")
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
        contentView.addSubview(cellName)
        contentView.addSubview(separatorView)
        
        
        
        cellName.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configureData(_ section1ItemData: ItemModel, itemRow: Int){
        cellName.text = section1ItemData.data
        self.itemRow = itemRow
    }
    
    
    
}
