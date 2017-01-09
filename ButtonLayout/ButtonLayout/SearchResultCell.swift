//
//  SearchResultCell.swift
//  ButtonLayout
//
//  Created by 杨卢青 on 2017/1/9.
//  Copyright © 2017年 杨卢青. All rights reserved.
//

import UIKit
import SnapKit

protocol SearchResultCellDelegate {
  
  func searchResultCellHeight(_ height: CGFloat)
}
class SearchResultCell: UITableViewCell {
  
  var elements = [""]
  
  
  var delegate: SearchResultCellDelegate?
  
  fileprivate var collectionView: UICollectionView?
  
  
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    
    let layout = FlexibleLayout()
    layout.delegate = self
    
    collectionView?.isScrollEnabled = false
    collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
    collectionView?.backgroundColor = UIColor.white
    collectionView?.register(SearchItemCell.self, forCellWithReuseIdentifier: "CellIdentifier")
    collectionView?.delegate = self
    collectionView?.dataSource = self

    addSubview(collectionView!)
    setupLayout()
  }
  
  func setupLayout() {
    collectionView?.snp.makeConstraints({ (make) in
      make.top.equalTo(self)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
      make.bottom.equalTo(self)
    })
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SearchResultCell: UICollectionViewDelegate {
  
}

extension SearchResultCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return elements.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! SearchItemCell
    cell.titleLabel.text = elements[indexPath.row]
    return cell
  }
}

extension SearchResultCell: FlexibleLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, widthForTextAt indexPath: IndexPath) -> CGFloat {
    let text: NSString = elements[indexPath.row] as NSString
    
    let frame = text.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat(34)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
    return ceil(frame.size.width) + 28
  }
  
  func collectionViewContaintHeight(_ height: CGFloat) {
    delegate?.searchResultCellHeight(height)
  }
}
