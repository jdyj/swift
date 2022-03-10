//
//  HeaderTabBarView.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/08.
//

import UIKit

class HeaderTabBarView: UICollectionReusableView {
  let models: [String] = ["안녕하세요", "저는", "상단 탭바", "입니다.", "헤더 뷰로", "구현했어요.", "탭의 너비도","label의 너비에","맞춰진","가변 길이에요"]

  static let identifier = "HeaderTabBarView"

  var selectedIndex: Int = 0
  private let collectionView: UICollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewCompositionalLayout(
      sectionProvider: { _, _ in
        let size: NSCollectionLayoutSize = NSCollectionLayoutSize(
          widthDimension: .estimated(120),
          heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
          layoutSize: size,
          subitems: [item])
        let section = NSCollectionLayoutSection(group: horizontalGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        return section
    }))
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    addSubview(collectionView)
    configureCollectionView()
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    collectionView.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }
  func configureCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = .systemBackground
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.alwaysBounceVertical = false
    collectionView.register(
      TabBarCollectionViewCell.self,
      forCellWithReuseIdentifier: TabBarCollectionViewCell.identifier)
  }
}
extension HeaderTabBarView: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell: TabBarCollectionViewCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: TabBarCollectionViewCell.identifier,
      for: indexPath) as? TabBarCollectionViewCell else {
        return UICollectionViewCell()
      }
    cell.configure(with: models[indexPath.row])
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return models.count
  }
}
