//
//  ViewController.swift
//  ListCountView
//
//  Created by 胡志辉 on 2018/3/1.
//  Copyright © 2018年 胡志辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   fileprivate var _dataArray = [String]()
    
    fileprivate var _tableView : UITableView?
    
    //懒加载listCountView
    fileprivate var _countView : TQListCountView = {
        let countView = TQListCountView()
        return countView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _dataArray = ["1111","2222","3333","4444","55555","66666","77777","8888","9999","0000","1212"]
        
        _tableView = UITableView(frame:CGRect(x: 0, y: 100, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.height - 100) , style: UITableViewStyle.plain)
        _tableView?.delegate = self
        _tableView?.dataSource = self
        _tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "listCount")
        self.view.addSubview(_tableView!)
        
    }
}
//MARK: - UITableView的代理
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCount", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = _dataArray[indexPath.row]
        return cell
    }
    
}
//MARK:-滚动代理
extension ViewController:UIScrollViewDelegate{
    //刚开始触摸的时候，显示总数据条数（可根据自己需求改变）
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let count = _dataArray.count
        //出现的调用方法
        self._countView.showIn(view: self.view, text: "共" + String(count) + "条" )
    }
    //结束触摸的时候，隐藏
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self._countView.hide()
    }
}









