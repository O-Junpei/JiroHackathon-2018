import UIKit

class BuyButton: UIButton {

    var iconImgView:UIImageView!
    var buyLabel:UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconImgView = UIImageView()
        iconImgView.isUserInteractionEnabled = false
        iconImgView.image = UIImage(named: "donburi")
        self.addSubview(iconImgView)

        //pageTitleLabel.font = UIFont.boldSystemFont(ofSize: 70)
        //pageTitleLabel.textAlignment = .center
        //pageTitleLabel.numberOfLines = 2
        //pageTitleLabel.isUserInteractionEnabled = false
        //pageTitleLabel.adjustsFontSizeToFitWidth = true
        
        buyLabel = UILabel()
        buyLabel.text = "購入する"
        buyLabel.font = UIFont.boldSystemFont(ofSize: 60)
        self.addSubview(buyLabel)
    }
    
    override func layoutSubviews() {
        
        let viewWidth = frame.width
        let viewHeight = frame.height
        
        iconImgView.frame = CGRect(x: viewWidth * 0.1, y: 0, width: viewHeight, height: viewHeight)
        buyLabel.frame =  CGRect(x: viewWidth * 0.1 + viewHeight, y: 0, width: viewWidth - (viewWidth * 0.15 + viewHeight), height: viewHeight)
    }
}
