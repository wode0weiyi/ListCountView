# ListCountView
# 使用方法：（注意：如果项目中有snpKit，则把本控件中的snapKit删除就可以了）
使用起来很简单，看代码

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
    
    
#    不明白或者有什么问题欢迎咨询
