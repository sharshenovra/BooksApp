import Foundation
import SnapKit
import youtube_ios_player_helper

class DetailedViewController: UIViewController{
    
    private lazy var contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2)
    
    lazy var scrollView1: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.contentSize = contentSize
        view.backgroundColor = UIColor(red: 221 / 255, green: 156 / 255 , blue: 119 / 255, alpha: 0.5)
        view.frame = self.view.bounds
        return view
    }()
    
    lazy var view1: UIView = {
        let view = UIView()
        view.frame.size = contentSize
        view.backgroundColor = UIColor(red: 221 / 255, green: 156 / 255 , blue: 119 / 255, alpha: 0.5)
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.textColor = .black
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var bookImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.textColor = .black
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        view.textAlignment = .center
        view.numberOfLines = 0
        view.textColor = .black
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var youtubeView: YTPlayerView = {
        let view = YTPlayerView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
        
    func setupSubviews(){
        view.addSubview(scrollView1)
        
        scrollView1.addSubview(view1)
        
        view1.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10)
        }
        
        view1.addSubview(bookImage)
        bookImage.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(7)
        }
        
        view1.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(bookImage.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(10)
        }
        
        view1.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        view1.addSubview(youtubeView)
        youtubeView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().dividedBy(7)
        }
    }
    
    }
    
