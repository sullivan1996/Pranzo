import UIKit

class DetailsVC: UIViewController, UIToolbarDelegate {
 
    let scrollView: UIScrollView = {
           let scrollView = UIScrollView()
           return scrollView
       }()
    var dish: Dish!
    let stackView = UIStackView()
    let imageDish = UIImageView()
    var foodTitle = UILabel()
    var chefTitle = UILabel()
    var restaruantTitle = UILabel()
    let toolbar = UIToolbar()
    let ingredientsLabel = UILabel()
    
    
    
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
        setupfoodTitle()
        setupIngredients()
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
   
    func setupfoodTitle() {
        self.stackView.addArrangedSubview(foodTitle)
        foodTitle.font = .systemFont(ofSize: 24, weight: .bold)
        foodTitle.textColor = .black
        foodTitle.text = "The Food"
        foodTitle.translatesAutoresizingMaskIntoConstraints = false
        foodTitle.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 20).isActive = true
        foodTitle.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
    }
    
    func setupIngredients() {
        self.stackView.addArrangedSubview(ingredientsLabel)
        ingredientsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        ingredientsLabel.numberOfLines = -1
        ingredientsLabel.textColor = .black
        ingredientsLabel.text = "\(dish.ingredients)"
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.topAnchor.constraint(equalTo: foodTitle.bottomAnchor, constant: 20).isActive = true
        ingredientsLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
    }
    
    
   
}
