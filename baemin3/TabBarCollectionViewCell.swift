//
//  TabBarCollectionViewCell.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/04.
//

import UIKit

class TabBarCollectionViewCell: UICollectionViewCell {
  static let identifier = "TabBarCollectionViewCell"

  private let label: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.textColor = .systemGray
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  override var isSelected: Bool {
    didSet {
      if isSelected {
        print("클릭됨")
        let backgroundColor: UIColor = UIColor(red: 236/255, green: 230/255, blue: 204/255, alpha: 1)
        contentView.backgroundColor = backgroundColor
        label.textColor = .systemBrown
        label.font = .systemFont(ofSize: 16, weight: .bold)
      } else {
        print("바로 해제")
        contentView.backgroundColor = .white
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 16, weight: .regular)
      }
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .white
    contentView.addSubview(label)
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = contentView.frame.size.height / 3
  }
  required init?(coder: NSCoder) {
    fatalError("TabBarCollectionViewCell init(coder:) has not been implemented.")
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    makeConstraints()
  }

  override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    super.preferredLayoutAttributesFitting(layoutAttributes)
    layoutIfNeeded()
    let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
    var frame = layoutAttributes.frame
    frame.size.width = ceil(size.width) + 20
    layoutAttributes.frame = frame
    return layoutAttributes
  }
}
extension TabBarCollectionViewCell {
  func makeConstraints() {
    label.sizeToFit()
    label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    label.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  func configure(with text: String) {
    label.text = text
  }
}
