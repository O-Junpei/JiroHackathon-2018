import UIKit

class CustomVC: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    
    //テーブルビューインスタンス
    private var syokuzaiTableView: UITableView!
    
    //テーブルビューに表示する配列
    private var myItems: Array = ["にんにく", "野菜", "豚肉", "醤油", "麺"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.title = "カスタム二郎"

        
        //Viewの大きさを取得
        let viewWidth = self.view.frame.size.width
        let viewHeight = self.view.frame.size.height
        
        //テーブルビューの初期化
        syokuzaiTableView = UITableView()
        
        //デリゲートの設定
        syokuzaiTableView.delegate = self
        syokuzaiTableView.dataSource = self
        
        //テーブルビューの大きさの指定
        syokuzaiTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        
        //テーブルビューの設置
        syokuzaiTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(syokuzaiTableView)

    }

    override func viewWillAppear(_ animated: Bool) {
        // hide bavigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return self.myItems.count
    }
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.myItems[indexPath.row]
        return cell
    }
    
    //Mark: テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番のセルを選択しました！ ")
    }
    
}
