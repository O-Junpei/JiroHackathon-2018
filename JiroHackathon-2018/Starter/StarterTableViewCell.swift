import UIKit

class StarterTableViewCell: UITableViewCell {

    var iconImageView:UIImageView!
    var kingakuLabel:UILabel!
    var nameLabel:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        iconImageView = UIImageView()
        kingakuLabel = UILabel()
        nameLabel = UILabel()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.width
        let height = frame.height //とりま100pxで決め打ち
        
        // height 100
        //timeLabel
        iconImageView.frame = CGRect(x: 8, y: 8, width: height - 16, height: height - 16)
        iconImageView.image = UIImage(named: "jiro_sample")
        self.addSubview(iconImageView)
        
        //
        kingakuLabel.frame = CGRect(x: 120, y: 8, width: width - 100, height: 42)
        kingakuLabel.font = UIFont.boldSystemFont(ofSize: 42)
        kingakuLabel.textColor = UIColor.black
        //kingakuLabel.text = "¥4500"
        kingakuLabel.textAlignment = NSTextAlignment.left
        self.addSubview(kingakuLabel)
        
        //
        nameLabel.frame = CGRect(x: 120, y: 50, width: width - 100, height: 42)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 42)
        nameLabel.textColor = UIColor.black
        nameLabel.text = "中山二郎風"
        nameLabel.textAlignment = NSTextAlignment.left
        self.addSubview(nameLabel)
        
    }
}
