//
//  SecondViewController.swift
//  bcsd8week
//
//  Created by 김성민 on 5/14/25.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var cellData: Models?
    var headerData: String?
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "설정"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Pretendard-Bold", size: 18)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Header : ???"
        label.font = UIFont(name: "Pretendard-Bold", size: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "Cell : ???"
        label.font = UIFont(name: "Pretendard-Bold", size: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        navigationItem.titleView = titleLabel

        
        if let cellData = cellData , let headerData = headerData {
            cellLabel.text = "Cell : \(cellData.name)"
            headerLabel.text = "Header : \(headerData)"
            
        }
        
    }
    
    private func setupLayout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(cellLabel)
        
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        
    }
    

}
