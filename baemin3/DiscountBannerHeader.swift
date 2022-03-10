//
//  DiscountBannerHeader.swift
//  baemin3
//
//  Created by 조재영 on 2022/03/04.
//

import UIKit

class DiscountBannerHeader: UICollectionReusableView {
    
    static let identifier = "discountBannerHeader"
    
    private let label: UILabel = {
       let label = UILabel()
        label.text = "오늘의 할인"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with labelText: String) {
        label.text = labelText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 22.0)
        label.textAlignment = .left
        
    }
}
