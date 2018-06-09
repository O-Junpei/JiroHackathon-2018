import UIKit

class SelecterVC: UIViewController {
    
    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewWidth = self.view.frame.width
        viewHeight = self.view.frame.height
        
        //self.view.backgroundColor = UIColor.init(named: "main")
        
        //庶民コース
        let cheapBtn = TopBtn()
        cheapBtn.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight * 0.33)
        cheapBtn.backgroundColor = .white
        cheapBtn.addTarget(self, action: #selector(goCheap(sender:)), for:.touchUpInside)
        cheapBtn.pageTitleLabel.text = "庶民コース"
        cheapBtn.pageTitleLabel.textColor = .black
        self.view.addSubview(cheapBtn)
        
        //一般コース
        let generalBtn = TopBtn()
        generalBtn.frame = CGRect(x: 0, y: viewHeight * 0.3, width: viewWidth, height: viewHeight * 0.33)
        generalBtn.backgroundColor = UIColor.init(named: "main")
        generalBtn.addTarget(self, action: #selector(goGeneral(sender:)), for:.touchUpInside)
        generalBtn.pageTitleLabel.text = "一般コース"
        generalBtn.pageTitleLabel.textColor = .black
        self.view.addSubview(generalBtn)
        
        //高級コース
        let expensiveBtn = TopBtn()
        expensiveBtn.frame = CGRect(x: 0, y: viewHeight * 0.66, width: viewWidth, height: viewHeight * 0.33)
        expensiveBtn.backgroundColor = .black
        expensiveBtn.addTarget(self, action: #selector(goExpensive(sender:)), for:.touchUpInside)
        expensiveBtn.pageTitleLabel.text = "高級コース"
        expensiveBtn.pageTitleLabel.textColor = UIColor.init(named: "main")
        self.view.addSubview(expensiveBtn)

    }
    //basicボタンが押されたら呼ばれます
    @objc internal func goCheap(sender: UIButton){
        let cheapVC:CheapVC = CheapVC()
        self.navigationController?.pushViewController(cheapVC, animated: true)
    }
    
    @objc internal func goGeneral(sender: UIButton){
        let generalVC:GeneralVC = GeneralVC()
        self.navigationController?.pushViewController(generalVC, animated: true)
    }
    
    @objc internal func goExpensive(sender: UIButton){
        let expensiveVC:ExpensiveVC = ExpensiveVC()
        self.navigationController?.pushViewController(expensiveVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // hide bavigationBar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

