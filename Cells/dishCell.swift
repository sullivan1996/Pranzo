import UIKit
class dishCell: UITableViewCell {
    
    var imageDish = UIImageView()
    var titleDish = UILabel()
    var priceDish = UILabel()
    var restaurantDish = UILabel()
    var chefName = UILabel()
    var imageChef = UIImageView()
    var whiteOver = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        configureImageView()
        configureTitle()
        configurePrice()
        configureWhiteview()
        configureRestaurantTitle()
        setupImagechef()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(imageDish)
        addSubview(titleDish)
        addSubview(priceDish)
        addSubview(restaurantDish)
        addSubview(whiteOver)
        addSubview(imageChef)
    }
    
    func set(dish: Dish) {
        imageDish.image = dish.chefPicture
        titleDish.text = dish.title
        priceDish.text = dish.price
        restaurantDish.text = dish.restaurant
        chefName.text = dish.chef
        imageChef.image = dish.image
    }
    
    func configureImageView() {
        imageDish.layer.cornerRadius = 15
        imageDish.contentMode = .scaleAspectFill
        imageDish.layer.zPosition = 0
        imageDish.layer.shadowRadius = 2
        imageDish.layer.shadowColor = UIColor.black.cgColor
        imageDish.layer.shadowOpacity = 0.25
        imageDish.layer.masksToBounds = false
        imageDish.translatesAutoresizingMaskIntoConstraints = false
        imageDish.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        imageDish.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18).isActive = true
        imageDish.heightAnchor.constraint(equalToConstant: 380).isActive = true
        imageDish.clipsToBounds = true
    }
    
    func configureTitle() {
        titleDish.numberOfLines = -1
        titleDish.font = .systemFont(ofSize: 32, weight: .bold)
        titleDish.textColor = .white
        titleDish.layer.zPosition = 1
        titleDish.layer.shadowColor = UIColor.black.cgColor
        titleDish.layer.shadowRadius = 2.0
        titleDish.layer.shadowOpacity = 1.0
        titleDish.layer.shadowOffset = CGSize(width: 3, height: 3)
        titleDish.layer.masksToBounds = false
        titleDish.translatesAutoresizingMaskIntoConstraints = false
        titleDish.leadingAnchor.constraint(equalTo: imageDish.leadingAnchor, constant: 20).isActive = true
        titleDish.topAnchor.constraint(equalTo: imageDish.topAnchor, constant: 30).isActive = true
    }
    
    func configurePrice() {
        priceDish.font = .systemFont(ofSize: 24, weight: .semibold)
        priceDish.textColor = .white
        priceDish.layer.zPosition = 1
        priceDish.layer.shadowColor = UIColor.black.cgColor
        priceDish.layer.shadowRadius = 2.0
        priceDish.layer.shadowOpacity = 1.0
        priceDish.layer.shadowOffset = CGSize(width: 3, height: 3)
        priceDish.layer.masksToBounds = false
        priceDish.translatesAutoresizingMaskIntoConstraints = false
        priceDish.leadingAnchor.constraint(equalTo: imageDish.leadingAnchor, constant: 20).isActive = true
        priceDish.topAnchor.constraint(equalTo: titleDish.bottomAnchor, constant: 5).isActive = true
    }
    
    func configureWhiteview() {
        whiteOver.backgroundColor = .white
        whiteOver.layer.cornerRadius = 15
        whiteOver.translatesAutoresizingMaskIntoConstraints = false
        whiteOver.bottomAnchor.constraint(equalTo: imageDish.bottomAnchor).isActive = true
        whiteOver.leadingAnchor.constraint(equalTo: imageDish.leadingAnchor).isActive = true
        whiteOver.trailingAnchor.constraint(equalTo: imageDish.trailingAnchor).isActive = true
        whiteOver.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    func configureRestaurantTitle() {
        restaurantDish.numberOfLines = 2
        restaurantDish.font = .systemFont(ofSize: 26, weight: .regular)
        restaurantDish.textColor = .black
        restaurantDish.layer.zPosition = 1
        restaurantDish.translatesAutoresizingMaskIntoConstraints = false
        restaurantDish.leadingAnchor.constraint(equalTo: whiteOver.leadingAnchor, constant: 20).isActive = true
        restaurantDish.bottomAnchor.constraint(equalTo: whiteOver.bottomAnchor, constant: -30).isActive = true
        restaurantDish.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    func configureChefName() {
        chefName.font = .systemFont(ofSize: 20, weight: .regular)
        chefName.textColor = .black
        chefName.numberOfLines = -1
        chefName.layer.zPosition = 1
        chefName.translatesAutoresizingMaskIntoConstraints = false
        chefName.trailingAnchor.constraint(equalTo: whiteOver.trailingAnchor, constant: -20).isActive = true
        chefName.topAnchor.constraint(equalTo: imageChef.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupImagechef() {
        imageChef.layer.cornerRadius = 60
        imageChef.layer.zPosition = 1
        imageChef.contentMode = .scaleAspectFill
        imageChef.translatesAutoresizingMaskIntoConstraints = false
        imageChef.bottomAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: -120).isActive = true
        imageChef.trailingAnchor.constraint(equalTo: imageDish.trailingAnchor, constant: -18).isActive = true
        imageChef.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageChef.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageChef.heightAnchor.constraint(equalToConstant: 380).isActive = true
        imageChef.clipsToBounds = true
    }
    
}
