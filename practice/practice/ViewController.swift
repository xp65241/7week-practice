//
//  ViewController.swift
//  practice
//
//  Created by 김성민 on 5/10/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    //Variable
    private let images: [UIImage] = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
    ]
    
    private let imagesName = ["ㅋㅋ" , "음" , "오잉" , "야!!" , "어 해봐~"]
    
    //UI Component
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        return tableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //setup

    private func setupUI(){
        view.backgroundColor = .systemBlue
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else{
            fatalError("The TableView could not dq a Custom Cell")
        }
        
        let image = self.images[indexPath.row]
        let name = imagesName[indexPath.row]
        cell.configure(image: image, label: name)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        let label = imagesName[indexPath.row]
        let image = images[indexPath.row]
        
        switch indexPath.row {
        case 0:
            let vc = firstViewController()
            vc.labelText = label
            vc.image = image
            navigationController?.pushViewController(vc, animated: true)
        default:
            return
            
        }
    }
    
    
}

