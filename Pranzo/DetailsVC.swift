import UIKit

class DetailsVC: UIViewController {
    
    var dish: Dish!
    var imageDish = UIImageView()
    var imageChef = UIImageView()
    var madebyLabel = UILabel()
    var chefName = UILabel()
    var ingredientsLabel = UILabel()
    var restaurantLabel = UILabel()
    let toolbar = UIToolbar()
    var adressLabel = UILabel()
    var drinkLabel = UILabel()
    let stackView = UIStackView()
    let scrollView: UIScrollView = {
          let scrollView = UIScrollView()
          return scrollView
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark.circle"), style: .plain, target: self, action: #selector(closeDetails))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(share))
        setupToolBar()
        setupScrollView()
        setupStackView()
        setupElements()
    }
    
    @objc func closeDetails() {
        dismiss(animated: true)
    }
    
    @objc func share() {
        let item: [Any] = ["Hey there! Check the dishes of \(dish.restaurant) ", URL(string: "https://google.com")!]
        let vc = UIActivityViewController(activityItems: item, applicationActivities: nil)
        present(vc, animated: true)
    }
    
    func setupToolBar() {
        view.addSubview(toolbar)
        toolbar.backgroundColor = .systemGray6
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        toolbar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        toolbar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    func setupScrollView() {
        self.view.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: toolbar.topAnchor).isActive = true;
    }
    
    func setupStackView() {
        self.scrollView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 30;
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
    }
 
    func setupElements() {
        setupHeaderimage()
     //  setupImagechef()
        configureMadeby()
        configureChefName()
        configureIngredients()
        setupRestaurantTitle()
        setupAdress()
        setupFreeDrinks()
    }
    
    func setupHeaderimage() {
        self.stackView.addArrangedSubview(imageDish)
        imageDish.contentMode = .scaleAspectFill
        imageDish.image = dish.chefPicture
        imageDish.translatesAutoresizingMaskIntoConstraints = false
        imageDish.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageDish.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        imageDish.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        imageDish.heightAnchor.constraint(equalToConstant: view.frame.height / 2).isActive = true
        imageDish.clipsToBounds = true
    }
    
    func setupImagechef() {
       self.stackView.addArrangedSubview(imageChef)
           imageChef.layer.cornerRadius = 45
           imageChef.image = dish.image
           imageChef.contentMode = .scaleAspectFill
           imageChef.translatesAutoresizingMaskIntoConstraints = false
           imageChef.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 20).isActive = true
           imageChef.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
           imageChef.heightAnchor.constraint(equalToConstant: 90).isActive = true
           imageChef.widthAnchor.constraint(equalToConstant: 90).isActive = true
           imageChef.heightAnchor.constraint(equalToConstant: 380).isActive = true
           imageChef.clipsToBounds = true
       }
    
    func configureMadeby() {
        self.stackView.addArrangedSubview(madebyLabel)
        madebyLabel.font = .systemFont(ofSize: 22, weight: .regular)
        madebyLabel.textColor = .black
        madebyLabel.text = "Made by"
        madebyLabel.translatesAutoresizingMaskIntoConstraints = false
        madebyLabel.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20).isActive = true
        madebyLabel.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 30).isActive = true
    }
    
    func configureChefName() {
           self.stackView.addArrangedSubview(chefName)
           chefName.font = .systemFont(ofSize: 22, weight: .bold)
           chefName.textColor = .black
           chefName.text = "\(dish.chef)"
           chefName.translatesAutoresizingMaskIntoConstraints = false
           chefName.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10).isActive = true
           chefName.topAnchor.constraint(equalTo: madebyLabel.bottomAnchor, constant: 5).isActive = true
       }
    
    func configureIngredients() {
        self.stackView.addArrangedSubview(ingredientsLabel)
        ingredientsLabel.font = .systemFont(ofSize: 18, weight: .regular)
        ingredientsLabel.textColor = .black
        ingredientsLabel.text = "\(dish.ingredients)"
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        ingredientsLabel.topAnchor.constraint(equalTo: chefName.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupRestaurantTitle() {
        self.stackView.addArrangedSubview(restaurantLabel)
        restaurantLabel.font = .systemFont(ofSize: 24, weight: .bold)
        restaurantLabel.textColor = .black
        restaurantLabel.text = "\(dish.restaurant)"
        restaurantLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        restaurantLabel.topAnchor.constraint(equalTo: ingredientsLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupAdress() {
        self.stackView.addArrangedSubview(adressLabel)
        adressLabel.font = .systemFont(ofSize: 20, weight: .regular)
        adressLabel.textColor = .black
        adressLabel.text = "\(dish.adress)"
        adressLabel.translatesAutoresizingMaskIntoConstraints = false
        adressLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        adressLabel.topAnchor.constraint(equalTo: restaurantLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    func setupFreeDrinks() {
        self.stackView.addArrangedSubview(drinkLabel)
        drinkLabel.font = .systemFont(ofSize: 16, weight: .regular)
        drinkLabel.textColor = .black
        drinkLabel.text = "Free drinks - showing the app to the cashier"
        drinkLabel.translatesAutoresizingMaskIntoConstraints = false
        drinkLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        drinkLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 20).isActive = true
    }
}
