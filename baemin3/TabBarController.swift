//
//  TabBarController.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/04.
//

import UIKit

class TabBarController: UIViewController {

  let tabbarData = [
    "배민1",
    "배민",
    "뭐가있겠지?",
    "또있겠지?"
  ]

  private let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in

    switch sectionIndex {
    case 0:
      let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(20),
                                                                           heightDimension: .fractionalHeight(1.0)))
      item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0 , bottom: 0, trailing: 0)

      let verticalGroup = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                           heightDimension: .absolute(120)),
        subitem: item,
        count: 1)

      let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(100),
                                                                                                  heightDimension: .absolute(120)),
                                                               subitem: verticalGroup,
                                                               count: 1)


      let section = NSCollectionLayoutSection(group: horizontalGroup)
      section.orthogonalScrollingBehavior = .groupPaging
      return section

    case 1:
      let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                           heightDimension: .fractionalHeight(1.0)))
      item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10 , bottom: 0, trailing: 10)

      let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .absolute(70)),
                                                     subitem: item,
                                                     count: 5)
      group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
      let section = NSCollectionLayoutSection(group: group)
      section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
      return section

    default:
      let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                           heightDimension: .fractionalHeight(1.0)))
      item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10 , bottom: 0, trailing: 10)

      let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                                                        heightDimension: .absolute(40)),
                                                     subitem: item,
                                                     count: 2)
      group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
      let section = NSCollectionLayoutSection(group: group)
      return section
    }


  }))

  // 생명 주기
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    collectionView.register(TabBarCollectionViewCell.self, forCellWithReuseIdentifier: TabBarCollectionViewCell.identifier)
    title = "서울과학기술대학교"
  }
}



extension TabBarController: UICollectionViewDelegate, UICollectionViewDataSource {

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch (section) {
    case 0:
      return tabbarData.count
    default:
      return 3
    }
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    switch (indexPath.section) {
    case 0:
      guard let tabbarCell : TabBarCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCollectionViewCell.identifier, for: indexPath)
              as? TabBarCollectionViewCell else {
                return UICollectionViewCell()
              }
      tabbarCell.configure(with: tabbarData[indexPath.row])
      return tabbarCell
    case 1:
      guard let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
              as? CollectionViewCell else { return UICollectionViewCell() }
      cell.backgroundColor = .gray
      return cell
    case 2:
      guard let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
              as? CollectionViewCell else { return UICollectionViewCell() }
      cell.backgroundColor = .gray
      return cell
    default: guard let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
                    as? CollectionViewCell else { return UICollectionViewCell() }
      cell.backgroundColor = .gray
      return cell
    }


  }
  

}
