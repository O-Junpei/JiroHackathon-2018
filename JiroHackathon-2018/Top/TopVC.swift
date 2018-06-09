import UIKit

class TopVC: UIViewController {

    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewWidth = self.view.frame.width
        viewHeight = self.view.frame.height
                
        //スターター二郎
        let starterBtn = TopBtn()
        starterBtn.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight * 0.5)
        starterBtn.backgroundColor = UIColor.init(named: "main")
        starterBtn.addTarget(self, action: #selector(goStarter(sender:)), for:.touchUpInside)
        starterBtn.pageTitleLabel.text = "スターター\n二郎"
        starterBtn.pageTitleLabel.textColor = .black
        self.view.addSubview(starterBtn)
        
        //カスタム二郎
        let customBtn = TopBtn()
        customBtn.frame = CGRect(x: 0, y: viewHeight * 0.5, width: viewWidth, height: viewHeight * 0.5)
        customBtn.backgroundColor = .black
        customBtn.addTarget(self, action: #selector(goCustum(sender:)), for:.touchUpInside)
        customBtn.pageTitleLabel.text = "カスタム\n二郎"
        customBtn.pageTitleLabel.textColor = UIColor.init(named: "main")
        self.view.addSubview(customBtn)
    }
    //basicボタンが押されたら呼ばれます
    @objc internal func goStarter(sender: UIButton){
        let starterVC:StarterVC = StarterVC()
        self.navigationController?.pushViewController(starterVC, animated: true)        
    }
    
    @objc internal func goCustum(sender: UIButton){
        let customVC:CustomVC = CustomVC()
        self.navigationController?.pushViewController(customVC, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        // hide bavigationBar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

