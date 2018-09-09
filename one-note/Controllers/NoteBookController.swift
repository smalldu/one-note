//
//  NoteBookController.swift
//  one-note
//
//  Created by 杜哲 on 2018/9/9.
//  Copyright © 2018年 duzhe. All rights reserved.
//

import UIKit

class NoteBookController: UIViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var closeButton: UIButton!
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  var viewModel: NoteBookViewModel
  
  let name: String
  init(_ name: String) {
    self.name = name
    viewModel = NoteBookViewModel(name)
    super.init(nibName: "NoteBookController", bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
}


// MARK: - setup

extension NoteBookController{
  
  func setup(){
    titleLabel.style(.title(self.name))
    closeButton.style(.add)
    closeButton.transform = CGAffineTransform.identity.rotated(by: CGFloat(Double.pi/4))
    titleLabel.hero.id = HeroID.bookTitle
    closeButton.hero.id = HeroID.close
    addButton.style(.add)
    addButton.hero.modifiers = [ .translate(x: 0, y: 50, z: 0) ]
    hero.isEnabled = true
    tableView.basicsConfig()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
}



// MARK: - operaters

extension NoteBookController{
  
  @IBAction func close(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func add(_ sender: Any) {
    let controller = AddNoteController()
    self.present(controller, animated: true, completion: nil)
  }
}



// MARK: - UITableViewDataSource

extension NoteBookController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let note = self.viewModel.notes[indexPath.row]
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count = self.viewModel.notes.count
    tableView.whenEmptyInBack(EmptyType.notes, rowCount: count)
    return count
  }
  
}

// MARK: - UITableViewDelegate

extension NoteBookController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
}












