import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class CheapVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //テーブルビューインスタンス
    private var starterTableView: UITableView!
    
    var starterData:JSON = []
    
    let indicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "庶民二郎"
        
        //Viewの大きさを取得
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let contentsHeight = viewHeight - statusBarHeight - navigationBarHeight
        
        //テーブルビューの初期化
        starterTableView = UITableView()
        starterTableView.delegate = self
        starterTableView.dataSource = self
        starterTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        starterTableView.rowHeight = 100
        starterTableView.register(StarterTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(StarterTableViewCell.self))
        
        self.view.addSubview(starterTableView)
        
        
        //お天気APIから東京の天気を取得する
        let url:String = "https://jirozon.herokuapp.com/starter/list?selector=syomin"
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
            
            switch response.result {
            case .success:
                let json:JSON = JSON(response.result.value ?? kill)
                print(json)
                self.indicator.stopAnimating()
                self.starterData = json
                self.starterTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
        // UIActivityIndicatorView のスタイルをテンプレートから選択
        indicator.activityIndicatorViewStyle = .whiteLarge
        indicator.center = self.view.center
        indicator.color = UIColor.black
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        self.view.bringSubview(toFront: indicator)
        indicator.startAnimating()
        
        //購入ボタン
        let buyButton = BuyButton()
        buyButton.frame = CGRect(x: 0, y: contentsHeight * 0.9, width: viewWidth, height: contentsHeight * 0.1)
        buyButton.backgroundColor = UIColor.init(named: "main")
        buyButton.buyLabel.text = "購入画面"
        buyButton.addTarget(self, action: #selector(goBuyView(sender:)), for:.touchUpInside)
        self.view.addSubview(buyButton)
    }
    
    @objc internal func goBuyView(sender: UIButton){
        let detailVC:DetailVC = DetailVC()
        detailVC.kingakuStr = "¥1880"
        detailVC.ninnikuStr = "庶民のにんにく"
        detailVC.yasaiStr = "庶民の豚"
        detailVC.butaStr = "庶民の豚"
        detailVC.syoyuStr = "庶民の醤油"
        detailVC.menStr = "庶民の麺"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // hide bavigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return starterData.count
    }
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        let cell:StarterTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(StarterTableViewCell.self))! as! StarterTableViewCell
        cell.kingakuLabel.text = "¥" + starterData[indexPath.row]["price"].stringValue
        cell.nameLabel.text = starterData[indexPath.row]["name"].stringValue
        
        let url = URL(string: starterData[indexPath.row]["image_url"].stringValue)!
        print(starterData[indexPath.row]["image_url"].stringValue)
        cell.iconImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "loading"))
        
        return cell
    }
    
    //Mark: テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
