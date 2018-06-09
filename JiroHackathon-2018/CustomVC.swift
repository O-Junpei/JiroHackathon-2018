import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import SCLAlertView


class CustomVC: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    
    //テーブルビューインスタンス
    private var syokuzaiTableView: UITableView!
    
    //テーブルビューに表示する配列
    private var contentsItems: Array = [["にんにく", ""], ["野菜", ""], ["豚肉", ""], ["醤油",""], ["麺",""]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "カスタム二郎"

        //Viewの大きさを取得
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight = (self.navigationController?.navigationBar.frame.size.height)!
        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let contentsHeight = viewHeight - statusBarHeight - navigationBarHeight
        
        //テーブルビューの初期化
        syokuzaiTableView = UITableView()
        
        //デリゲートの設定
        syokuzaiTableView.delegate = self
        syokuzaiTableView.dataSource = self
        
        //テーブルビューの大きさの指定
        syokuzaiTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        
        //テーブルビューの設置
        syokuzaiTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        syokuzaiTableView.register(ContentsTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ContentsTableViewCell.self))
        syokuzaiTableView.rowHeight = 100
        self.view.addSubview(syokuzaiTableView)
        
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
        detailVC.ninnikuStr = contentsItems[0][0]
        detailVC.yasaiStr = contentsItems[1][0]
        detailVC.butaStr = contentsItems[2][0]
        detailVC.syoyuStr = contentsItems[3][0]
        detailVC.menStr = contentsItems[4][0]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        // hide bavigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return self.contentsItems.count
    }
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        let cell:ContentsTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ContentsTableViewCell.self))! as! ContentsTableViewCell
        
        cell.nameLabel.text = contentsItems[indexPath.row][0]
        
        if !contentsItems[indexPath.row][1].isEmpty {
            let url = URL(string: contentsItems[indexPath.row][1])!
            cell.iconImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "loading"))
        }
        
        
        return cell
    }
    
    //Mark: テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 0:
            //にんにく
            let url:String = HEROKU_URL + "/search/genres?genre_id=0"
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
                
                switch response.result {
                case .success:
                    let json:JSON = JSON(response.result.value ?? kill)
                    let alertView = SCLAlertView()
                    
                    for i in 0..<json.count {
                        print("i: \(i)")
                        alertView.addButton(json[i]["name"].stringValue) {
                            self.contentsItems[0][0] = json[i]["name"].stringValue
                            self.contentsItems[0][1] = json[i]["image_url"].stringValue
                            self.syokuzaiTableView.reloadData()
                        }
                    }
                    alertView.showSuccess("にんにく", subTitle: "にんにくを選択してください")
                    
                case .failure(let error):
                    print(error)
                }
            }
            
        case 1:
            //野菜
            let url:String = HEROKU_URL + "/search/genres?genre_id=4"
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
                
                switch response.result {
                case .success:
                    let json:JSON = JSON(response.result.value ?? kill)
                    let alertView = SCLAlertView()
                    
                    for i in 0..<json.count {
                        print("i: \(i)")
                        alertView.addButton(json[i]["name"].stringValue) {
                            self.contentsItems[1][0] = json[i]["name"].stringValue
                            self.contentsItems[1][1] = json[i]["image_url"].stringValue
                            self.syokuzaiTableView.reloadData()
                        }
                    }
                    alertView.showSuccess("野菜", subTitle: "野菜を選択してください")
                    
                case .failure(let error):
                    print(error)
                }
            }
        case 2:
            //豚肉
            let url:String = HEROKU_URL + "/search/genres?genre_id=2"
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
                
                switch response.result {
                case .success:
                    let json:JSON = JSON(response.result.value ?? kill)
                    let alertView = SCLAlertView()
                    
                    for i in 0..<json.count {
                        print("i: \(i)")
                        alertView.addButton(json[i]["name"].stringValue) {
                            self.contentsItems[2][0] = json[i]["name"].stringValue
                            self.contentsItems[2][1] = json[i]["image_url"].stringValue
                            self.syokuzaiTableView.reloadData()
                        }
                    }
                    alertView.showSuccess("豚肉", subTitle: "豚肉を選択してください")
                    
                case .failure(let error):
                    print(error)
                }
            }
        case 3:
            //醤油
            let url:String = HEROKU_URL + "/search/genres?genre_id=5"
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
                
                switch response.result {
                case .success:
                    let json:JSON = JSON(response.result.value ?? kill)
                    let alertView = SCLAlertView()
                    
                    for i in 0..<json.count {
                        print("i: \(i)")
                        alertView.addButton(json[i]["name"].stringValue) {
                            self.contentsItems[3][0] = json[i]["name"].stringValue
                            self.contentsItems[3][1] = json[i]["image_url"].stringValue
                            self.syokuzaiTableView.reloadData()
                        }
                    }
                    alertView.showSuccess("醤油", subTitle: "醤油を選択してください")
                    
                case .failure(let error):
                    print(error)
                }
            }
        case 4:
            //醤油
            let url:String = HEROKU_URL + "/search/genres?genre_id=6"
            Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{ response in
                
                switch response.result {
                case .success:
                    let json:JSON = JSON(response.result.value ?? kill)
                    let alertView = SCLAlertView()
                    
                    for i in 0..<json.count {
                        print("i: \(i)")
                        alertView.addButton(json[i]["name"].stringValue) {
                            self.contentsItems[4][0] = json[i]["name"].stringValue
                            self.contentsItems[4][1] = json[i]["image_url"].stringValue
                            self.syokuzaiTableView.reloadData()
                        }
                    }
                    alertView.showSuccess("麺", subTitle: "麺を選択してください")
                    
                case .failure(let error):
                    print(error)
                }
            }

        default:
            print("aaa")
        }
        
        
        print("\(indexPath.row)番のセルを選択しました！ ")
    }
    
}
