//
//  CampusFacilityViewController.swift
//  coin
//
//  Created by 김성민 on 5/12/25.
//

import UIKit
import SnapKit

class CampusFacilityViewController: UIViewController {
    
    private let items = [
        (UIImage(named: "2")!, "능수관" , "11:40 ~ 13:30" , "미운영"),
        (UIImage(named: "3")!, "대즐" , "08:30 ~ 21:00" , "11:00 ~ 18:30"),
        (UIImage(named: "4")!, "서점,문구점" , "09:00 ~ 18:00" , "미운영"),
        (UIImage(named: "5")!, "우편취급국" , "09:00 ~ 18:00" , "미운영"),
        (UIImage(named: "6")!, "세탁소" , "11:30 ~ 18:00" , "미운영"),
        (UIImage(named: "7")!, "미용실" , "09:30 ~ 17:00" , "미운영"),
        (UIImage(named: "8")!, "안경원" , "10:00 ~ 19:00" , "미운영"),
        (UIImage(named: "9")!, "복사실" , "10:00 ~ 19:00" , "미운영"),
    ]

    
    private let facilitiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(CampusFacilityCollectionViewCell.self, forCellWithReuseIdentifier: CampusFacilityCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20 , weight: .bold)
        label.textColor = .black
        label.text = "24-2학기 시설물 운영시간"
        return label
    }()
    
    private let subInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "기간 : 2024년 9월 2일 ~ 12월 20일"
        label.textColor = .systemGray
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "교내 시설물 정보"
        view.backgroundColor = .white
        
        facilitiesCollectionView.dataSource = self
        facilitiesCollectionView.delegate = self
        
        setupUI()
    }
    
    
    private func setupUI() {
        view.addSubview(facilitiesCollectionView)
        
        view.addSubview(infoLabel)
        view.addSubview(subInfoLabel)
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(10)
        }
        subInfoLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(5)
            $0.leading.equalTo(view.snp.leading).offset(10)
        }
        
        facilitiesCollectionView.snp.makeConstraints {
            $0.top.equalTo(subInfoLabel.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
}

extension CampusFacilityViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CampusFacilityCollectionViewCell.identifier, for: indexPath) as? CampusFacilityCollectionViewCell else {
            fatalError("DQ failed")
        }
        let (image, mainLabelText,weekText, weekendText) = items[indexPath.item]
        cell.configure(image: image, mainLabelText: mainLabelText, weekText: weekText, weekendText: weekendText)
        return cell
    }
}

extension CampusFacilityViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 20 , height: 100)
    }
}
