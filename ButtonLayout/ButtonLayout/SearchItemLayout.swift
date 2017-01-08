//
//  SearchItemLayout.swift
//  ButtonLayout
//
//  Created by 杨卢青 on 2017/1/8.
//  Copyright © 2017年 杨卢青. All rights reserved.
//

import UIKit

protocol SearchItemLayoutDelegate {
	func collectionView(_ collectionView: UICollectionView, widthForTextAt indexPath: IndexPath) -> CGFloat
}
class SearchItemLayout: UICollectionViewLayout {
	public var leftWidthInLine = CGFloat()
	public var lines = 1
	public var leftMargin = CGFloat(10)
	public var lineSpace = CGFloat(10)
	public var lineHeight = CGFloat(25)
	
	var delegate: SearchItemLayoutDelegate?
	
	fileprivate var cache = [UICollectionViewLayoutAttributes]()
	
	override func prepare() {
		doit()
	}
	
	func doit() {
		if cache.count < 1 {
			guard let totalCount = collectionView?.numberOfItems(inSection: 0)
				else { return }
			
			guard let collectionView = collectionView else { return }
			let lineWidth = collectionView.bounds.size.width
			leftWidthInLine = lineWidth
			for i in 0 ..< totalCount {
				let indexPath = IndexPath(row: i, section: 0)
				guard let width = delegate?.collectionView(collectionView, widthForTextAt: indexPath) else { return }
				
				if leftWidthInLine - width > 0 {
					
				} else {
					lines += 1
					leftWidthInLine = lineWidth
				}
				let frame = CGRect(x: lineWidth - leftWidthInLine, y: (lineHeight + lineSpace) * CGFloat(lines - 1), width: width, height: lineHeight)
				leftWidthInLine -= width + leftMargin
				let attribute = UICollectionViewLayoutAttributes.init(forCellWith: indexPath)
				attribute.frame = frame
				cache.append(attribute)
			}
		}
	}
	
	override var collectionViewContentSize: CGSize {
		guard let collectionView = collectionView else { return .zero }
		let height = CGFloat(lines) * lineHeight + CGFloat(lines - 1) * lineSpace
		return CGSize(width: collectionView.bounds.width, height: height)
	}
	
	override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
		var attributsArray = [UICollectionViewLayoutAttributes]()
		cache.forEach { (attributs) in
			if rect.contains(attributs.frame) {
				attributsArray.append(attributs)
			}
		}
		return attributsArray
	}
}
