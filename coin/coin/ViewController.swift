//
//  ViewController.swift
//  coin
//
//  Created by 김성민 on 5/12/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let navigationButton: UIButton = {
        let button = UIButton()
        button.setTitle("교내 시설 정보 보기", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapNavigationButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "메인화면"
        view.backgroundColor = .white
        setupUI()
    }

    
    private func setupUI(){
        view.addSubview(navigationButton)
        
        navigationButton.snp.makeConstraints {
            $0.centerX.equalTo(view.snp.centerX)
            $0.centerY.equalTo(view.snp.centerY)
            $0.height.width.equalTo(50)
        }
    }
    
    @objc private func tapNavigationButton(){
        let nextViewController = CampusFacilityViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}

