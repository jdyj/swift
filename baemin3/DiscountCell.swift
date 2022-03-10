//
//  DiscountCell.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/04.
//

import UIKit

class DiscountCell: UICollectionViewCell {


  static let identifier = "discountCell"

  private let imgView: UIImageView = {
    let imgView = UIImageView()
    imgView.image = UIImage(named: "discount1.png")
    return imgView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubview(imgView)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  func configure(with image: String) {
    imgView.image = UIImage(named: "\(image).png")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    imgView.translatesAutoresizingMaskIntoConstraints = false
    imgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    imgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    imgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    imgView.image = nil
  }
}
