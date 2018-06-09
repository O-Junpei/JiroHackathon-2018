import UIKit

class TopBtn: UIButton {
    
    var pageTitleLabel:UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        pageTitleLabel = UILabel()
        pageTitleLabel.font = UIFont.boldSystemFont(ofSize: 70)
        pageTitleLabel.textAlignment = .center
        pageTitleLabel.numberOfLines = 2
        pageTitleLabel.isUserInteractionEnabled = false
        pageTitleLabel.adjustsFontSizeToFitWidth = true
        pageTitleLabel.minimumScaleFactor = 0.5
        
        self.addSubview(pageTitleLabel)
    }
    
    override func layoutSubviews() {
        
        let viewWidth = frame.width
        let viewHeight = frame.height
        pageTitleLabel.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
    }
}
