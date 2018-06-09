
import UIKit

class ContentsTableViewCell: UITableViewCell {

    var iconImageView:UIImageView!
    var nameLabel:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        iconImageView = UIImageView()
        iconImageView.image = UIImage(named: "loading")
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
        self.addSubview(iconImageView)
        
        
        //
        nameLabel.frame = CGRect(x: 108, y: 29, width: width - 110, height: 42)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 42)
        nameLabel.textColor = UIColor.black
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.8
        nameLabel.textAlignment = NSTextAlignment.left
        //nameLabel.text = "adada"
        self.addSubview(nameLabel)
    }

}
