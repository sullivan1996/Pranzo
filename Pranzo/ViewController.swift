import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dishes: [Dish] = []
    let tableView = UITableView(frame: .zero, style: .grouped)
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        tableView.register(dishCell.self, forCellReuseIdentifier: "cellId")
        tableView.delegate = self
        tableView.dataSource = self
        dishes = fetchData()
        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! dishCell
        cell.clipsToBounds = true
        cell.backgroundColor = .systemGroupedBackground
        cell.selectionStyle = .none
        let dishList = dishes[indexPath.row]
        cell.set(dish: dishList)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let Dish = dishes[indexPath.row]
        let vc = DetailsVC()
        vc.dish = Dish
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}

extension ViewController {
    func fetchData() -> [Dish] {
        let firstDish = Dish(title: "pasta al Pesto",
                             price: "4€",
                             restaurant: "Pizzeria Cibus",
                             chef: "Chef Giovanni",
                             chefPicture: Images.cibusImage,
                             image: Images.cibusChef,
                             subtitle: "",
                             ingredients: "Tomatoes, basilico, Pesto, Pasta",
                             adress: "Via Giovanni Cassino 123, Napoli (NA)",
                             chefBio: "il piu bello dei piu belli chef",
                             picture1: Images.cibusChef,
                             picture2: Images.cibusChef,
                             picture3: Images.cibusChef,
                             picture4: Images.cibusChef,
                             picture5: Images.cibusChef,
                             picture6: Images.cibusChef)
        
        let secondDish = Dish(title: "Pizza",
        price: "3€",
        restaurant: "Frosina",
        chef: "Chef Gianni",
        chefPicture: Images.cibusImage,
        image: Images.cibusChef,
        subtitle: "",
        ingredients: "Tomatoes, Mozzarella, Farina",
        adress: "Via Giovanni Cassino 123, Napoli (NA)",
        chefBio: "grande chef",
        picture1: Images.cibusChef,
        picture2: Images.cibusChef,
        picture3: Images.cibusChef,
        picture4: Images.cibusChef,
        picture5: Images.cibusChef,
        picture6: Images.cibusChef)
        
        return [firstDish, secondDish]
    }
}


