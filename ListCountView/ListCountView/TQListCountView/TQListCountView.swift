//
//  TQListCountView.swift
//  PingAnTong_WenZhou
//
//  Created by 王璇 on 2018/2/8.
//  Copyright © 2018年 maomao. All rights reserved.
//

import UIKit

fileprivate let margin = 20
fileprivate let viewWidth = 50
fileprivate let viewHeight = 20

class TQListCountView: UIView {
    
    fileprivate var isShow = false
    fileprivate var isHide = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    fileprivate lazy var _backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.4
        return view
    }()
    
    fileprivate lazy var _label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
}

extension TQListCountView {
    fileprivate func setUpView() {
        self.alpha = 0
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        self.addSubview(self._backgroundView)
        self.addSubview(self._label)
        
        _backgroundView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        _label.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.center.equalTo(self)
        }
    }
    //调用方法
    func showIn(view: UIView, text: String) {
        if isShow == true {return}
        isShow = true
        
        if self.superview != view {
            view.addSubview(self)
            
            self.snp.makeConstraints { (make) in
                make.bottom.equalTo(view).offset(-margin)
                make.centerX.equalTo(view)
                make.size.equalTo(CGSize(width: viewWidth, height: viewHeight))
            }
        }
        _label.text = text
        UIView.animate(withDuration: 0.1) {
            self.layoutIfNeeded()
            self.alpha = 1
            self.perform(#selector(self.hide), with: nil, afterDelay: 3)
        }
    }
    //隐藏方法
    @objc func hide() {
        if isHide == true || isShow == false {return}
        isHide = true
        
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0
            self.isShow = false
            self.isHide = false
        }
    }
}
