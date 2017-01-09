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

class SearchCountryViewController: UIViewController {
  //    private let disposeBag = DisposeBag()
  
  fileprivate var tableView = UITableView()
  fileprivate var reuseIdentifier = "SearchResultCell"
  
  fileprivate var resultSearchHeight = CGFloat(0)
  fileprivate var hotSearchHeight = CGFloat(0)
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
    setupLayout()
    setupRx()
  }
  
  //MARK: Setup
  
  func setupViews() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.register(SearchResultCell.self, forCellReuseIdentifier: reuseIdentifier)
    view.addSubview(tableView)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 2)) { 
      self.tableView.reloadData()
    }
  }
  
  func setupLayout() {
    tableView.snp.makeConstraints { (make) in
      make.top.equalTo(view).offset(64)
      make.left.equalTo(view)
      make.right.equalTo(view)
      make.bottom.equalTo(view)
    }
  }
  
  func setupRx() {
    
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
