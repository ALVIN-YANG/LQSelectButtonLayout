//
//  SearchCellHeaderView.swift
//  ButtonLayout
//
//  Created by 杨卢青 on 2017/1/9.
//  Copyright © 2017年 杨卢青. All rights reserved.
//

import UIKit
import SnapKit

class SearchCellHeaderView: UIView {
  
  var titleLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    titleLabel.font = UIFont.systemFont(ofSize: 14)
    titleLabel.textColor = UIColor.black
    titleLabel.textAlignment = .center
    titleLabel.sizeToFit()
    addSubview(titleLabel)
    titleLabel.snp.makeConstraints { (make) in
      make.centerY.equalTo(self)
      make.left.equalTo(self).offset(20)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
