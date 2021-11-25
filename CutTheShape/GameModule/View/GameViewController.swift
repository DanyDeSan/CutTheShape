//
//  ViewController.swift
//  CutTheShape
//
//  Created by L Daniel De San Pedro on 23/11/21.
//

import UIKit

/*
    Explanation
        The ViewController will hold all the outlets and also will register any event
        that occurs on the view. Every event should be repported to the presenter, and
        the presenter will decide what happens. The view controller adapts its content
        according to what the presenter provides.
 */

// MARK: - class - GameViewController
final class GameViewController: UIViewController {
    // MARK: Attributes
    var presenter: GamePresenterProtocol?
    // MARK: Outlets
    @IBOutlet weak var timerLabel: UILabel?
    @IBOutlet weak var actionButton: UIButton?
    @IBOutlet weak var mainGameView: UIView?
    
    // MARK: Static methods
    static func instantiateView() -> GameViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "GameViewController", bundle: nil)
        guard let view: GameViewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController else {
            return GameViewController()
        }
        return view
    }
    
    // MARK: View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func tapOnButton(_ sender: UIButton) {
        
    }
}

// MARK: - extension - GameViewProtocol
extension GameViewController: GameViewProtocol {
    func configureView(with model: GameViewModel) {
        mainGameView?.backgroundColor = model.gameViewBackground
        actionButton?.setTitle(model.initialButtonState.rawValue, for: .normal)
        actionButton?.backgroundColor = model.buttonBackGroundColor
        actionButton?.layer.masksToBounds = true
        actionButton?.layer.cornerRadius = model.cornerRadius
        mainGameView?.layer.masksToBounds = true
        mainGameView?.layer.cornerRadius = model.cornerRadius
    }
}
