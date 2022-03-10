//
//  CategoryTVC.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/03.
//

import UIKit

class CategoryCell: UICollectionViewCell {

  static let identifier = "CategoryCell"

  private let img: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "1인분.png")
    return img
  }()

  private let label: UILabel = {
    let label = UILabel()
    label.text = "default"
    return label
  }()
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(img)
    contentView.addSubview(label)
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  func configure(with text: String) {
    label.text = text
    img.image = UIImage(named: "\(text).png")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    img.translatesAutoresizingMaskIntoConstraints = false
    //        img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    //        img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    img.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    label.translatesAutoresizingMaskIntoConstraints = false
    label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -10).isActive = true
    label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 70).isActive = true
    label.font = UIFont.systemFont(ofSize: 10)
    label.textAlignment = .center
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    img.image = nil
  }
}
