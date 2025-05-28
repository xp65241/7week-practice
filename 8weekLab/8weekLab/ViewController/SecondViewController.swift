//
//  SecondViewController.swift
//  8weekLab
//
//  Created by 김성민 on 5/24/25.
//

import UIKit
import SnapKit

final class SecondViewController: UIViewController {
    
    final let lineSpacing: CGFloat = 6;
    final let interItemSpacing: CGFloat = 0;
    final let cellHeight: CGFloat = 30;
    final let inset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
    
    private var section1ItemData = ItemModel.Info1()
    private var section2ItemData = ItemModel.Info2()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "학생식당정보"
        label.font = UIFont(name: "Pretendard-Medium", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(dismissView))
        button.tintColor = .black
        return button
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        label.text = "24-2학기 학생식당 운영시간"
        label.font = UIFont(name: "Pretendard-Bold", size: 20)
        label.textColor = .black
        return label
    }()
    
    private let section1TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "평일 운영시간"
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textColor = UIColor(named: "#175C8E")
        return label
    }()
    
    private let section2TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "주말 운영시간"
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        label.textColor = UIColor(named: "#175C8E")
        return label
    }()
    
    
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "위치"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(named: "#4B4B4B")
        return label
    }()
    
    private let locationInfo: UILabel = {
        let label = UILabel()
        label.text = "학생회관 2층"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = UIColor(named: "#4B4B4B")
        return label
    }()
    
    private let telLabel: UILabel = {
        let label = UILabel()
        label.text = "전화번호"
        label.font = UIFont(name: "Pretendard-Medium", size: 14)
        label.textColor = UIColor(named: "#4B4B4B")
        return label
    }()
    
    private let telInfo: UILabel = {
        let label = UILabel()
        label.text = "041-560-1278"
        label.font = UIFont(name: "Pretendard-Regular", size: 14)
        label.textColor = UIColor(named: "#4B4B4B")
        return label
    }()
 
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#F5F5F5")
        return view
    }()
    
    private let section1BottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#CACACA")
        return view
    }()
    
    private let section2BottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "#CACACA")
        return view
    }()
    
    
    private let WeekdayInfoSectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionViewCell1.self, forCellWithReuseIdentifier: CollectionViewCell1.identifier)
        cv.register(CollectionViewHeaderCell1.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeaderCell1.identifier)
        return cv
    }()
    
    private let WeekendInfoSectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionViewCell1.self, forCellWithReuseIdentifier: CollectionViewCell1.identifier)
        cv.register(CollectionViewHeaderCell1.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewHeaderCell1.identifier)
        return cv
    }()
    
    private let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "2024.03.09 업데이트"
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.textColor = UIColor(named: "#8E8E8E")
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.titleView = titleLabel
        navigationItem.leftBarButtonItem = buttonItem
        setLayout()
        WeekdayInfoSectionView.delegate = self
        WeekdayInfoSectionView.dataSource = self
        
        WeekendInfoSectionView.delegate = self
        WeekendInfoSectionView.dataSource = self
        
    }
    
    
    
    @objc private func dismissView(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    private func setLayout(){
        [topLabel, locationLabel, locationInfo , telLabel, telInfo , separatorView, WeekdayInfoSectionView , section1BottomSeparatorView,section1TitleLabel , WeekendInfoSectionView, section2BottomSeparatorView , section2TitleLabel , footerLabel].forEach { view.addSubview($0)
        }
        
        WeekdayInfoSectionView.backgroundColor = .white
        
        topLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(12)
            $0.leading.equalToSuperview().offset(24)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(24)
        }
        
        
        WeekdayInfoSectionView.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(49)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(144)
        }
        
        section1BottomSeparatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(WeekdayInfoSectionView)
            $0.bottom.equalTo(WeekdayInfoSectionView.snp.bottom).offset(-5)
        }
        
        section2BottomSeparatorView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalTo(WeekdayInfoSectionView)
            $0.bottom.equalTo(WeekendInfoSectionView.snp.bottom).offset(-5)
        }
        
        locationInfo.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(4)
            $0.leading.equalTo(locationLabel.snp.trailing).offset(8)
        }
        
        telLabel.snp.makeConstraints{
            $0.top.equalTo(locationLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(24)
        }
        telInfo.snp.makeConstraints {
            $0.top.equalTo(locationInfo.snp.bottom)
            $0.leading.equalTo(telLabel.snp.trailing).offset(8)
        }
        
        separatorView.snp.makeConstraints{
            $0.top.equalTo(telLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(6)
        }
        
        section1TitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.top.equalTo(separatorView.snp.bottom).offset(12)
        }
        
        WeekendInfoSectionView.snp.makeConstraints{
            $0.top.equalTo(section1BottomSeparatorView.snp.bottom).offset(57)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(144)
        }
        
        section2TitleLabel.snp.makeConstraints{
            $0.top.equalTo(section1BottomSeparatorView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(24)
        }
        
        footerLabel.snp.makeConstraints{
            $0.top.equalTo(section2BottomSeparatorView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(24)
        }
    }
}







extension SecondViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView{
            return ItemModel.Info1().count
        }
        else if collectionView == WeekendInfoSectionView{
            return ItemModel.Info1().count
        }
        return 0
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == WeekdayInfoSectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell1.identifier, for: indexPath) as? CollectionViewCell1 else {
                return UICollectionViewCell()
            }
            cell.configureData(section1ItemData[indexPath.row], itemRow: indexPath.item)
            return cell
        }
        else if collectionView == WeekendInfoSectionView{
            guard let cell = WeekendInfoSectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell1.identifier, for: indexPath) as? CollectionViewCell1 else {
                return UICollectionViewCell()
            }
            cell.configureData(section2ItemData[indexPath.row], itemRow: indexPath.item)
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == WeekdayInfoSectionView{
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = WeekdayInfoSectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeaderCell1.identifier, for: indexPath) as? CollectionViewHeaderCell1 else {
                    return UICollectionReusableView()
                }
                headerView.configureHeader(with: .defaultHeader)
                return headerView
            }
            return UICollectionViewCell()
        }
        else if collectionView == WeekendInfoSectionView{
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = WeekendInfoSectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewHeaderCell1.identifier, for: indexPath) as? CollectionViewHeaderCell1 else {
                    return UICollectionReusableView()
                }
                headerView.configureHeader(with: .defaultHeader)
                return headerView
            }
            return UICollectionViewCell()
        }
        return UICollectionReusableView()
    }
}






extension SecondViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - inset.left - inset.right
        return CGSize(width: width / 3 , height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width , height : 34)
    }
}
