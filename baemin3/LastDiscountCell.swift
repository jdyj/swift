//
//  LastDiscountCell.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/09.
//

import UIKit

class LastDiscountCell: UICollectionViewCell {

  static let identifier = "lastdiscountCell"

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
    imgView.widthAnchor.constraint(equalToConstant: frame.size.width / 2).isActive = true
    imgView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    imgView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    super.preferredLayoutAttributesFitting(layoutAttributes)
    layoutIfNeeded()
    let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
    var frame = layoutAttributes.frame
    frame.size.width = ceil(size.width / 2)
    layoutAttributes.frame = frame
    return layoutAttributes
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    imgView.image = nil
  }
}
