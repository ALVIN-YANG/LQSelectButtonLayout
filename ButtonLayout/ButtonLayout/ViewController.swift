//
//  ViewController.swift
//  ButtonLayout
//
//  Created by 杨卢青 on 2017/1/8.
//  Copyright © 2017年 杨卢青. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var collectionView: UICollectionView?
	
	var elements = ["是的", "顺丰到付", "放大放大的", "但是", "得分", "哥特而过", "地方如果认购", "杜莎夫人", "霍元甲"]
	
	override func viewDidLoad() {
		super.viewDidLoad()

		let layout = SearchItemLayout()
		layout.delegate = self
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
		setupCollectionView()
		view.addSubview(collectionView!)
		collectionView?.reloadData()
	}
	
	func setupCollectionView() {
		collectionView?.backgroundColor = UIColor.black
		
		collectionView?.register(UINib.init(nibName: "SearchItemCell", bundle: nil), forCellWithReuseIdentifier: "CellIdentifier")
		collectionView?.delegate = self
		collectionView?.dataSource = self
	}
}

extension ViewController: UICollectionViewDelegate {
	
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		print("number: ", elements.count)
		return elements.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! SearchItemCell
				cell.textLabel.text = elements[indexPath.row]
				cell.layer.cornerRadius = 5
				cell.clipsToBounds = true
				cell.backgroundColor = UIColor.white
				return cell
	}
}

extension ViewController: SearchItemLayoutDelegate {
	func collectionView(_ collectionView: UICollectionView, widthForTextAt indexPath: IndexPath) -> CGFloat {
		debugPrint(elements.count)
		debugPrint(indexPath.row)
		let text: NSString = elements[indexPath.row] as NSString
		
		let frame = text.boundingRect(with: CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat(25)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)], context: nil)
		return ceil(frame.size.width) + 14
	}
	
}

