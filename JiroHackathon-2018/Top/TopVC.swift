import UIKit

class TopVC: UIViewController {

    var viewWidth:CGFloat!
    var viewHeight:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewWidth = self.view.frame.width
        viewHeight = self.view.frame.height
        
        //self.view.backgroundColor = UIColor.init(named: "main")
        
        //スターター二郎
        let starterBtn = TopBtn()
        starterBtn.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight * 0.5)
        starterBtn.backgroundColor = UIColor.init(named: "main")
        starterBtn.addTarget(self, action: #selector(basicButtonClicked(sender:)), for:.touchUpInside)
        starterBtn.pageTitleLabel.text = "スターター\n二郎"
        starterBtn.pageTitleLabel.textColor = .black
        self.view.addSubview(starterBtn)
        
        //カスタム二郎
        let customBtn = TopBtn()
        customBtn.frame = CGRect(x: 0, y: viewHeight * 0.5, width: viewWidth, height: viewHeight * 0.5)
        customBtn.backgroundColor = .black
        customBtn.addTarget(self, action: #selector(basicButtonClicked(sender:)), for:.touchUpInside)
        customBtn.pageTitleLabel.text = "カスタム\n二郎"
        customBtn.pageTitleLabel.textColor = UIColor.init(named: "main")
        self.view.addSubview(customBtn)
    }
    //basicボタンが押されたら呼ばれます
    @objc internal func basicButtonClicked(sender: UIButton){
        let starterVC:StarterVC = StarterVC()
        self.navigationController?.pushViewController(starterVC, animated: true)        
    }

    override func viewWillAppear(_ animated: Bool) {
        // hide bavigationBar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

