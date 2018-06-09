import UIKit

class StarterVC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    //テーブルビューインスタンス
    private var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "スターター二郎"
        
        //Viewの大きさを取得
        let viewWidth = self.view.frame.size.width
        let viewHeight = self.view.frame.size.height
        
        //テーブルビューの初期化
        myTableView = UITableView()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        myTableView.rowHeight = 100
        myTableView.register(StarterTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(StarterTableViewCell.self))

        self.view.addSubview(myTableView)
    
    }

    override func viewWillAppear(_ animated: Bool) {
        // hide bavigationBar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    //MARK: テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        return 10
    }
    
    //MARK: テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        let cell:StarterTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(StarterTableViewCell.self))! as! StarterTableViewCell
        return cell
    }
    
    //Mark: テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC:DetailVC = DetailVC()
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
