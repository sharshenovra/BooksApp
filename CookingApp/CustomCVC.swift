//
//  CustomCVC.swift
//  CookingApp
//
//  Created by Ruslan Sharshenov on 08.01.2022.
//

import UIKit
import SnapKit
import Kingfisher

class CustomCVC: UICollectionViewCell {
    
    static let identifier = "CustomCVC"
    
    private lazy var titleText: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    private lazy var priceText: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    lazy var myImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemTeal
        contentView.addSubview(titleText)
        contentView.addSubview(myImageView)
        contentView.addSubview(priceText)
        contentView.clipsToBounds = true
        
    }
    
    override func layoutSubviews() {
        titleText.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(6)
        }
        
        myImageView.snp.makeConstraints { make in
            make.top.equalTo(titleText.snp.bottom)
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
        }
        priceText.snp.makeConstraints { make in
            make.top.equalTo(myImageView.snp.bottom)
            make.height.equalToSuperview().dividedBy(8)
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(label: String, image: URL, price: String) {
        titleText.text = label
        myImageView.kf.setImage(with: image)
        priceText.text = price
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleText.text = nil
        priceText.text = nil
    }
    
}
