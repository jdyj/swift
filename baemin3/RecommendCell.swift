//
//  RecommendCell.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/08.
//

import UIKit

class RecommendCell: UICollectionViewCell {
    
    static let identifier = "recommendCell"

    private let imgView: UIImageView = {
       let imgView = UIImageView()
        imgView.image = UIImage(named: "default.png")
        return imgView
    }()
    
    private let label: UILabel = {
       let label = UILabel()
        label.text = "default"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
        contentView.backgroundColor = UIColor.green
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.addSubview(imgView)
        contentView.addSubview(label)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func configure(with text: String) {
        label.text = text
        imgView.image = UIImage(named: "\(text).png")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: frame.size.height / 2).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -50).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        label.textAlignment = .center
    }
}
