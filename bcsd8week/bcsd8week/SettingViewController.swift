//
//  ViewController.swift
//  bcsd8week
//
//  Created by 김성민 on 5/14/25.
//

import UIKit
import SnapKit


class SettingViewController: UIViewController {
    
    let dataList: [[Models]] = [Models.info1(), Models.info2() , Models.info3()]
    
    
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "설정"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Pretendard-Bold", size: 18)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    private let section1TableView: UITableView = {
        let s1T = UITableView(frame: .zero, style: .plain)
        s1T.backgroundColor = .white
        s1T.allowsFocus = false
        s1T.register(Section1TableViewCell.self, forCellReuseIdentifier: Section1TableViewCell.identifier)
        return s1T
    }()
    
    private let section2TableView: UITableView = {
        let s2T = UITableView(frame: .zero, style: .plain)
        s2T.backgroundColor = .white
        s2T.allowsFocus = true
        s2T.register(Section2TableViewCell.self, forCellReuseIdentifier: Section2TableViewCell.identifier)
        return s2T
    }()
    
    private let section3TableView: UITableView = {
        let s3T = UITableView(frame: .zero, style: .plain)
        s3T.backgroundColor = .white
        s3T.allowsFocus = true
        s3T.register(Section3TableViewCell.self, forCellReuseIdentifier: Section3TableViewCell.identifier)
        return s3T
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        navigationItem.titleView = titleLabel
        
        section1TableView.delegate = self
        section1TableView.dataSource = self
        
        section2TableView.delegate = self
        section2TableView.dataSource = self
        
        section3TableView.delegate = self
        section3TableView.dataSource = self
        
        setColor()
        setupUI()
    }
    
    
    
    private func setColor(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "175C8E")
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupUI(){
        view.addSubview(section1TableView)
        view.addSubview(section2TableView)
        view.addSubview(section3TableView)
        
        section1TableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(212)
            $0.leading.trailing.equalToSuperview()
        }
        
        section2TableView.snp.makeConstraints {
            $0.top.equalTo(section1TableView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(270)
        }
        
        section3TableView.snp.makeConstraints {
            $0.top.equalTo(section2TableView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        let section1HeaderView = Section1TableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 38))
        section1TableView.tableHeaderView = section1HeaderView
        
        let section2HeaderView = Section2TableViewHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 38))
        section2TableView.tableHeaderView = section2HeaderView
    }


}


extension SettingViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == section1TableView {
            return dataList[0].count
        } else if tableView == section2TableView {
            return dataList[1].count
        } else if tableView == section3TableView {
            return dataList[2].count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == section1TableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Section1TableViewCell.identifier, for: indexPath) as? Section1TableViewCell else { fatalError("ERROR")}
            let data = dataList[0][indexPath.row]
            cell.configure(text: data.name)
            return cell
        }
        
        else if tableView == section2TableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Section2TableViewCell.identifier, for: indexPath) as? Section2TableViewCell else { fatalError("ERROR")}
            let data = dataList[1][indexPath.row]
            cell.configureSection2(text: data.name)
            return cell
        }
        
        else if tableView == section3TableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Section3TableViewCell.identifier, for: indexPath) as? Section3TableViewCell else { fatalError("ERROR")}
            let data = dataList[2][indexPath.row]
            cell.configureSection3(text: data.name)
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == section1TableView {
            return 58
        } else if tableView == section2TableView {
            return 58
        } else if tableView == section3TableView {
            return 58
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedModel: Models?
        var selectedSection: String?
        
        if tableView == section1TableView {
            selectedModel = dataList[0][indexPath.row]
            selectedSection = "일반"
        } else if tableView == section2TableView {
            selectedModel = dataList[1][indexPath.row]
            selectedSection = "서비스"
        } else if tableView == section3TableView {
            selectedModel = dataList[2][indexPath.row]
            selectedSection = "서비스"
        }
        
        guard let selectModel = selectedModel , let selectSection = selectedSection else { return }
        let SecondVC = SecondViewController()
        SecondVC.cellData = selectModel
        SecondVC.headerData = selectSection
        navigationController?.pushViewController(SecondVC, animated: true)
    }
}



