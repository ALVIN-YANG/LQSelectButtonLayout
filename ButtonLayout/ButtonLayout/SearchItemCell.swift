//
//  SearchItemCell.swift
//  Vulcanus
//
//  Created by haha on 16/8/1.
//  Copyright © 2016年 Alex Young. All rights reserved.
//

import UIKit
import SnapKit

class SearchItemCell: UICollectionViewCell {
//	@IBOutlet weak var textLabel: UILabel!

  var titleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    layer.borderWidth = 1
    layer.borderColor = UIColor.lightGray.cgColor
    layer.cornerRadius = 17
    clipsToBounds = true
    layer.backgroundColor = UIColor.white.cgColor
    titleLabel.font = UIFont.systemFont(ofSize: 14)
    titleLabel.textColor = UIColor.gray
    titleLabel.textAlignment = .center
    addSubview(titleLabel)
  }
  
  func setupLayout() {
    titleLabel.snp.makeConstraints { (make) in
      make.edges.equalTo(self)
    }
  }
}
