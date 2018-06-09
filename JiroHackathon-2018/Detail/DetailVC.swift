import UIKit
import SCLAlertView

class DetailVC: UIViewController {
    

    var kingakuStr:String = "¥4500"
    var ninnikuStr:String = "サポーターズ産、一年にんにく"
    var yasaiStr:String = "レバレジーズ産、ヒカリエ野菜"
    var butaStr:String = "クックパッド産、ガーデン豚"
    var syoyuStr:String = "サイバー産、キラキラ醤油"
    var menStr:String = "コロプラ産、もちもち麺"

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "詳細"
        self.view.backgroundColor = UIColor.white
        
        //高さ
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let contentsHeight = viewHeight - statusBarHeight - navigationBarHeight
        
        let ramenImageView = UIImageView()
        ramenImageView.image = UIImage(named: "nabejiro")
        ramenImageView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: contentsHeight * 0.4)
        ramenImageView.contentMode = .scaleToFill
        self.view.addSubview(ramenImageView)
        
        let priceLabel = UILabel()
        priceLabel.frame = CGRect(x: 0, y: contentsHeight * 0.42, width: viewWidth, height:  contentsHeight * 0.08)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 42)
        priceLabel.textColor = UIColor.black
        priceLabel.text = kingakuStr
        priceLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(priceLabel)
        
        let garlicLabel = UILabel()
        garlicLabel.frame = CGRect(x: 0, y: contentsHeight * 0.50, width: viewWidth, height: contentsHeight * 0.06)
        garlicLabel.font = UIFont.boldSystemFont(ofSize: 24)
        garlicLabel.textColor = UIColor.black
        garlicLabel.text = ninnikuStr
        garlicLabel.textAlignment = .center
        self.view.addSubview(garlicLabel)
        
        let vegetablesLabel = UILabel()
        vegetablesLabel.frame = CGRect(x: 0, y: contentsHeight * 0.58, width: viewWidth, height: contentsHeight * 0.06)
        vegetablesLabel.font = UIFont.boldSystemFont(ofSize: 24)
        vegetablesLabel.textColor = UIColor.black
        vegetablesLabel.text = yasaiStr
        vegetablesLabel.textAlignment = .center
        self.view.addSubview(vegetablesLabel)
        
        let porkLabel = UILabel()
        porkLabel.frame = CGRect(x: 0, y: contentsHeight * 0.66, width: viewWidth, height: contentsHeight * 0.06)
        porkLabel.font = UIFont.boldSystemFont(ofSize: 24)
        porkLabel.textColor = UIColor.black
        porkLabel.text = butaStr
        porkLabel.textAlignment = .center
        self.view.addSubview(porkLabel)
        
        let soyLabel = UILabel()
        soyLabel.frame = CGRect(x: 0, y: contentsHeight * 0.74, width: viewWidth, height: contentsHeight * 0.06)
        soyLabel.font = UIFont.boldSystemFont(ofSize: 24)
        soyLabel.textColor = UIColor.black
        soyLabel.textAlignment = .center
        soyLabel.text = syoyuStr
        self.view.addSubview(soyLabel)
        
        let menLabel = UILabel()
        menLabel.frame = CGRect(x: 0, y: contentsHeight * 0.82, width: viewWidth, height: contentsHeight * 0.06)
        menLabel.font = UIFont.boldSystemFont(ofSize: 24)
        menLabel.textColor = UIColor.black
        menLabel.textAlignment = .center
        menLabel.text = menStr
        self.view.addSubview(menLabel)
        
        //購入ボタン
        let buyButton = BuyButton()
        buyButton.frame = CGRect(x: 0, y: contentsHeight * 0.9, width: viewWidth, height: contentsHeight * 0.1)
        buyButton.backgroundColor = UIColor.init(named: "main")
        buyButton.addTarget(self, action: #selector(buy(sender:)), for:.touchUpInside)
        self.view.addSubview(buyButton)
    }
    
    @objc internal func buy(sender: UIButton){
        SCLAlertView().showSuccess("購入完了", subTitle: "美味しい家二郎を楽しんで！！！")
    }
}
