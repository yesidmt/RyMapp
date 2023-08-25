//
//  FactoryApp.swift
//  CeibaApp
//
//  Created by yesid mendoza on 24/08/23.
//

import UIKit

/// ListUsersView Module View
class ListUsersView: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableSessionUser: UITableView!
    // MARK: - Properties
    private var items = [Item]()
    var presenter: ListUserPresenter?
    var usersData: [Users] = []
    var filterUsers: [Users]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getAllUsers()
        registerNibsCells()
        configureTableView()
        searchBar.delegate = self
        self.title = "Prueba de ingreso"
    }
    
    func configureTableView() {
        tableSessionUser.dataSource = self
        tableSessionUser.delegate = self
    }
    func registerNibsCells(){
        let sessionUserCell = String(describing: SessionUserCell.self)
        tableSessionUser.register(UINib(nibName: sessionUserCell, bundle: nil), forCellReuseIdentifier: sessionUserCell)
        let nodataCell = String(describing: NodataCell.self)
        tableSessionUser.register(UINib(nibName: nodataCell, bundle: nil), forCellReuseIdentifier: nodataCell)
    }
}
// MARK: - extending listUserView to implement it's protocol
extension ListUsersView: listUserViewProtocol {
    func setItemsTableviewUsers(users: Users) {
        self.usersData.append(users)
        self.filterUsers = self.usersData
        DispatchQueue.main.async {
            self.tableSessionUser.reloadData()
        }
    }
}

extension ListUsersView: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filterUsers == nil {
          return 0
           
        } else{
            if filterUsers[0].data.count == 0 {
                return 1
            }else {
                return filterUsers[0].data.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if filterUsers[0].data.count == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NodataCell", for: indexPath) as? NodataCell else {
                        fatalError("Unable to dequeue Cell")}
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SessionUserCell", for: indexPath) as? SessionUserCell else {
                        fatalError("Unable to dequeue Cell")}
            let it = Item(id: filterUsers[0].data[indexPath.row].id,name: filterUsers[0].data[indexPath.row].name,status: filterUsers[0].data[indexPath.row].status, species: filterUsers[0].data[indexPath.row].species,image: filterUsers[0].data[indexPath.row].image)
            cell.setData(item: it)
            return cell
        }
    }
  
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.goToDetail(user:filterUsers[0].data[indexPath.row])
    }
}

extension ListUsersView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterUsers = []
        filterUsers.append(Users(data: []))
        if searchText == "" {
            filterUsers = usersData
            self.tableSessionUser.reloadData()
            return
        }
        for item in usersData[0].data {
            if item.name.uppercased().contains(searchText.uppercased()) {
                filterUsers[0].data.append(item)
            }
        }
        self.tableSessionUser.reloadData()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.searchBar.endEditing(true)
           super.touchesBegan(touches, with: event)
       }
}

