//
//  ViewController.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/03.
//

import UIKit


class ViewController: UIViewController {
  let bannerData = [
    "banner1.png",
    "banner2.png",
    "banner3.png"
  ]

  let categoryData = [
    "1인분",
    "한식",
    "분식",
    "카페 디저트",
    "돈까스",
    "치킨",
    "피자",
    "아시안 양식",
    "중국집",
    "족발 보쌈",
    "야식",
    "찜 탕",
    "도시락",
    "패스트푸드",
    "브랜드관",
    "맛집랭킹"
  ]

  let discountData = [
    "discount1",
    "discount2",
    "discount3",
    "discount4",
    "discount5",
    "discount6",
    "discount7",
    "discount8",
    "discount9",
    "discount10",
    "discount11"
  ]

  //    let recommendData = [
  //        ["recommend1", "돈까스회관 공릉점", "5.0", "41~56분", "9,000원", "0.1km", "0원~2,500원"],
  //        ["recommend2", "맘모스덮밥 공릉야식1호점", "4.8", "22~37분", "9,000원", "0.2km", "0~2,800원"],
  //        ["recommend3", "안성희 순대국&해장국 본점", "3.5", "45~60분", "9,000원", "0.8km", "2,000원~3,000원"],
  //        ["recommend4", "프랭크버거", "4.9", "41~56분", "7,500원", "0.8km", "0원~3,300원"],
  //        ["recommend5", "떡개비 공릉점", "5.0", "38~53분", "9,000원", "0.4km", "1,000원~3,500원"],
  //        ["recommend6", "오르새피자 공릉본점", "5.0", "39~54분", "14,000원", "0.9km", "1,000원"]
  //    ]
  let recommendData = [
    "recommend1",
    "recommend2",
    "recommend3",
    "recommend4",
    "recommend5",
    "recommend6"
  ]


  // 이거는 컬렉션 뷰 안에 있는 내용을 어떻게 할 것인가 정해준 것
  private let collectionView: UICollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewCompositionalLayout(
      sectionProvider: { sectionIndex, _ in
        switch sectionIndex {
        case 0:
          let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
          item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

          let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120)),
            subitem: item,
            count: 1)

          let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120)),
            subitem: verticalGroup,
            count: 1)


          let section = NSCollectionLayoutSection(group: horizontalGroup)
          section.orthogonalScrollingBehavior = .groupPaging
          return section
        case 1:
          let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
          item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

          let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70)),
            subitem: item,
            count: 5)
          group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
          let section = NSCollectionLayoutSection(group: group)
          section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
          return section
        case 2:
          let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
          item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

          let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(150)),
            subitems: [item])
          let section = NSCollectionLayoutSection(group: horizontalGroup)
          section.orthogonalScrollingBehavior = .continuous
          section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 30, trailing: 0)

          let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))


          section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(
              layoutSize: headerSize,
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
          ]
          return section

        case 3:
          let pagingheader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
          pagingheader.pinToVisibleBounds = true
          let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(240)))
          item.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 30, trailing: 10)

          let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(360)),
            subitem: item,
            count: 1)

          let section = NSCollectionLayoutSection(group: verticalGroup)
          section.boundarySupplementaryItems = [pagingheader]
          return section

        case 4:
          let pagingheader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
          pagingheader.pinToVisibleBounds = true
          let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120)))
          item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

          let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(360)),
            subitem: item,
            count: 1)

          let section = NSCollectionLayoutSection(group: verticalGroup)
          section.orthogonalScrollingBehavior = .groupPaging
          section.boundarySupplementaryItems = [pagingheader]
          return section

        default:
          let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
          item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

          let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120)),
            subitem: item,
            count: 1)
          group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
          let section = NSCollectionLayoutSection(group: group)
          return section
        }}
    ))

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
    collectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
    collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
    collectionView.register(DiscountCell.self, forCellWithReuseIdentifier: DiscountCell.identifier)
    collectionView.register(
      DiscountBannerHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: DiscountBannerHeader.identifier)
    collectionView.register(
      HeaderTabBarView.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: HeaderTabBarView.identifier)
    collectionView.register(RecommendCell.self, forCellWithReuseIdentifier: RecommendCell.identifier)
    collectionView.register(LastDiscountCell.self, forCellWithReuseIdentifier: LastDiscountCell.identifier)

    title = "서울과학기술대학교"
  }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 4
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch indexPath.section {
    case 2:
      guard let headerview: DiscountBannerHeader = collectionView.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionHeader,
        withReuseIdentifier: DiscountBannerHeader.identifier,
        for: indexPath) as? DiscountBannerHeader else { return UICollectionReusableView() }
      headerview.configure(with: "오늘의 할인")
      return headerview
    case 3:
      guard let headerview: HeaderTabBarView = collectionView.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionHeader,
        withReuseIdentifier: HeaderTabBarView.identifier,
        for: indexPath) as? HeaderTabBarView else { return UICollectionReusableView() }
      headerview.configureCollectionView()
      return headerview
    default:
      guard let headerview: DiscountBannerHeader = collectionView.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionHeader,
        withReuseIdentifier: DiscountBannerHeader.identifier,
        for: indexPath) as? DiscountBannerHeader else { return UICollectionReusableView() }
      headerview.configure(with: "오늘의 할인")
      return headerview
    }
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case 0:
      return bannerData.count
    case 1:
      return categoryData.count
    case 2:
      return discountData.count
    case 3:
      return recommendData.count
    case 4:
      return recommendData.count
    default:
      return 10
    }
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.section {
    case 0:
      guard let bannerCell: BannerCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: BannerCell.identifier, for: indexPath)
        as? BannerCell else { return UICollectionViewCell() }
      bannerCell.configure(with: bannerData[indexPath.row])
      return bannerCell
    case 1:
      guard let categoryCell: CategoryCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: CategoryCell.identifier, for: indexPath)
        as? CategoryCell else { return UICollectionViewCell() }
      categoryCell.configure(with: categoryData[indexPath.row])
      return categoryCell
    case 2:
      switch indexPath.row {
      case discountData.count - 1:
        guard let discountCell: LastDiscountCell = collectionView.dequeueReusableCell(
          withReuseIdentifier: LastDiscountCell.identifier, for: indexPath)
          as? LastDiscountCell else { return UICollectionViewCell() }
        discountCell.configure(with: discountData[indexPath.row])
        return discountCell
      default:
        guard let discountCell: DiscountCell = collectionView.dequeueReusableCell(
          withReuseIdentifier: DiscountCell.identifier, for: indexPath)
          as? DiscountCell else { return UICollectionViewCell() }
        discountCell.configure(with: discountData[indexPath.row])
        return discountCell
      }
    case 3:
      guard let recommendCell: RecommendCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: RecommendCell.identifier, for: indexPath)
        as? RecommendCell else { return UICollectionViewCell() }
      recommendCell.configure(with: recommendData[indexPath.row])
      return recommendCell
    default:
      guard let cell: CollectionViewCell = collectionView.dequeueReusableCell(
        withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        as? CollectionViewCell else { return UICollectionViewCell() }
      cell.backgroundColor = .gray
      return cell
    }
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
      print("호출함?")
      if indexPath.section == 2 {
        if indexPath.row == discountData.count - 1 {
          return CGSize(width: view.frame.size.width / 2, height: view.frame.size.height)
        }
      }
      return CGSize(width: view.frame.size.width, height: view.frame.size.height)
  }
}
