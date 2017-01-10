//
//  SearchCountryViewController.swift
//  ButtonLayout
//
//  Created by 杨卢青 on 2017/1/9.
//  Copyright (c) 2017年 杨卢青. All rights reserved.
//

import UIKit
//import RxSwift
//import RxCocoa
import TwicketSegmentedControl

class SearchCountryViewController: UIViewController {
  //    private let disposeBag = DisposeBag()
  
  fileprivate var tableView = UITableView()
  fileprivate var reuseIdentifier = "SearchResultCell"
  
  fileprivate var resultSearchHeight = CGFloat(0)
  fileprivate var hotSearchHeight = CGFloat(0)
  
  fileprivate var searchBar = UISearchBar()
  fileprivate var segmentedControl = TwicketSegmentedControl()
  fileprivate var redView = UIView()
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupLayout()
    setupRx()
  }
  
  //MARK: Setup
  
  func setupViews() {
    
    let titles = ["国家", "景点", "城市"]
    segmentedControl.setSegmentItems(titles)
    segmentedControl.sliderBackgroundColor = UIColor.white
    segmentedControl.defaultTextColor = UIColor.white
    segmentedControl.highlightTextColor = UIColor.red
    segmentedControl.segmentsBackgroundColor = UIColor.red
    
    segmentedControl.delegate = self
    
    searchBar.backgroundImage = UIImage()
    searchBar.enablesReturnKeyAutomatically = true
    searchBar.placeholder = "搜索国家, 城市, 景点"
    searchBar.delegate = self

    view.addSubview(redView)
    view.addSubview(searchBar)
    view.addSubview(segmentedControl)
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.register(SearchResultCell.self, forCellReuseIdentifier: reuseIdentifier)
    
    redView.backgroundColor = .red

    view.addSubview(tableView)
//    DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 2)) { 
//      self.tableView.reloadData()
//    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  func setupLayout() {
    redView.snp.makeConstraints { (make) in
      make.top.equalTo(view)
      make.right.equalTo(view)
      make.left.equalTo(view)
      make.height.equalTo(130)
    }
    searchBar.snp.makeConstraints { (make) in
      make.top.equalTo(redView).offset(20)
      make.left.equalTo(view).offset(20)
      make.right.equalTo(view).offset(-20)
    }
    segmentedControl.snp.makeConstraints { (make) in
      make.bottom.equalTo(redView).offset(-10)
      make.right.equalTo(view).offset(-20)
      make.left.equalTo(view).offset(20)
      make.height.equalTo(36)
    }
    tableView.snp.makeConstraints { (make) in
      make.top.equalTo(redView.snp.bottom)
      make.left.equalTo(view)
      make.right.equalTo(view)
      make.bottom.equalTo(view)
    }
  }
  
  func setupRx() {
    
  }
}

extension SearchCountryViewController: UISearchBarDelegate {
  
}

extension SearchCountryViewController: TwicketSegmentedControlDelegate {
  func didSelect(_ segmentIndex: Int) {
    debugPrint(segmentIndex)
  }
}

extension SearchCountryViewController: UITableViewDelegate {
  
}

extension SearchCountryViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    switch section {
    case 0:
      let resultHeader = SearchCellHeaderView()
      resultHeader.titleLabel.text = "搜索结果"
      return resultHeader
    case 1:
      let hotSearch = SearchCellHeaderView()
      hotSearch.titleLabel.text = "热门国家"
      return hotSearch
    default:
      return nil
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0,
         1:
      return 44
    default:
      return CGFloat.leastNonzeroMagnitude
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = SearchResultCell()
      cell.elements = ["是的", "顺丰到付", "放大放大的", "但是", "得分", "哥特而过", "地方如果认购", "杜莎夫人", "霍元甲", "是的", "顺丰到付", "放大放大的", "但是", "得分", "哥特而过", "地方如果认购", "杜莎夫人", "霍元甲"]
      cell.delegate = self
      return cell
    case 1:
      let cell = SearchHotCell()
      cell.elements = ["是的", "顺丰到付", "放大放大的", "但是", "得分", "哥特而过", "地方如果认购", "杜莎夫人", "霍元甲", "杜莎夫人", "霍元甲"]
      cell.delegate = self
      return cell
    default:
      return UITableViewCell()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      return resultSearchHeight
    case 1:
      return hotSearchHeight
    default:
      return CGFloat.leastNonzeroMagnitude
    }
  }
}

extension SearchCountryViewController: SearchResultCellDelegate, SearchHotCellDelegate {
  func searchResultCellHeight(_ height: CGFloat) {
    resultSearchHeight = height
  }

  func searchHotCellHeight(_ height: CGFloat) {
    hotSearchHeight = height
  }
}
