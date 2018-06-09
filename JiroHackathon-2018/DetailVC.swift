import UIKit

class DetailVC: UIViewController {

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
        ramenImageView.image = UIImage(named: "jiro_sample")
        ramenImageView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: contentsHeight * 0.4)
        ramenImageView.backgroundColor = .blue
        ramenImageView.contentMode = .scaleAspectFit
        self.view.addSubview(ramenImageView)
        
        let priceLabel = UILabel()
        priceLabel.frame = CGRect(x: 0, y: contentsHeight * 0.42, width: viewWidth, height:  contentsHeight * 0.08)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 42)
        priceLabel.textColor = UIColor.black
        priceLabel.text = "¥4500"
        priceLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(priceLabel)
        
        let garlicLabel = UILabel()
        garlicLabel.frame = CGRect(x: 0, y: contentsHeight * 0.50, width: viewWidth, height: contentsHeight * 0.06)
        garlicLabel.font = UIFont.boldSystemFont(ofSize: 24)
        garlicLabel.textColor = UIColor.black
        garlicLabel.text = "サポーターズ産、一年にんにく"
        garlicLabel.textAlignment = .center
        self.view.addSubview(garlicLabel)
        
        let vegetablesLabel = UILabel()
        vegetablesLabel.frame = CGRect(x: 0, y: contentsHeight * 0.58, width: viewWidth, height: contentsHeight * 0.06)
        vegetablesLabel.font = UIFont.boldSystemFont(ofSize: 24)
        vegetablesLabel.textColor = UIColor.black
        vegetablesLabel.text = "レバレジーズ産、ヒカリエ野菜"
        vegetablesLabel.textAlignment = .center
        self.view.addSubview(vegetablesLabel)
        
        let porkLabel = UILabel()
        porkLabel.frame = CGRect(x: 0, y: contentsHeight * 0.66, width: viewWidth, height: contentsHeight * 0.06)
        porkLabel.font = UIFont.boldSystemFont(ofSize: 24)
        porkLabel.textColor = UIColor.black
        porkLabel.text = "クックパッド産、ガーデン豚"
        porkLabel.textAlignment = .center
        self.view.addSubview(porkLabel)
        
        let soyLabel = UILabel()
        soyLabel.frame = CGRect(x: 0, y: contentsHeight * 0.74, width: viewWidth, height: contentsHeight * 0.06)
        soyLabel.font = UIFont.boldSystemFont(ofSize: 24)
        soyLabel.textColor = UIColor.black
        soyLabel.textAlignment = .center
        soyLabel.text = "サイバー産、キラキラ醤油"
        self.view.addSubview(soyLabel)
        
        let menLabel = UILabel()
        menLabel.frame = CGRect(x: 0, y: contentsHeight * 0.82, width: viewWidth, height: contentsHeight * 0.06)
        menLabel.font = UIFont.boldSystemFont(ofSize: 24)
        menLabel.textColor = UIColor.black
        menLabel.textAlignment = .center
        menLabel.text = "コロプラ産、もちもち麺"
        self.view.addSubview(menLabel)
        
        //購入ボタン
        let buyButton = UIButton()
        buyButton.frame = CGRect(x: 0, y: contentsHeight * 0.9, width: viewWidth, height: contentsHeight * 0.1)
        buyButton.backgroundColor = .red
        self.view.addSubview(buyButton)
    }
}