//
//  ViewController.swift
//  practice2
//
//  Created by 김성민 on 5/11/25.
//

import UIKit

class ViewController: UIViewController{

    private let items = [
        (UIImage(systemName: "house")! , "집"),
        (UIImage(systemName: "heart")! , "하트"),
        (UIImage(systemName: "bolt")! , "번개"),
        (UIImage(systemName: "star")! , "별"),
        (UIImage(systemName: "flame")! , "불"),
        
    ]
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemBlue
        cv.delegate = self
        cv.dataSource = self
        cv.register(CustomCell.self , forCellWithReuseIdentifier: CustomCell.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
    }
    
    
    private func setupUI(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -500)
        ])
    }


}

extension ViewController: UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            fatalError("DQ failed")
        }
        let (image, title) = items[indexPath.item]
        cell.configure(image: image, text: title)
        return cell
    }
        
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: collectionView.frame.height - 20)
    }
    
}
