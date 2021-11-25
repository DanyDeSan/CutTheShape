//
//  GameProtocols.swift
//  CutTheShape
//
//  Created by L Daniel De San Pedro on 23/11/21.
//

import Foundation
import UIKit

// MARK: protocol - GameViewRouter
protocol GameRouterProtocol: AnyObject {
    static func instantiateModule() -> UIViewController
}

// MARK: protocol - GameViewProtocol
protocol GameViewProtocol: UIViewController {
    var presenter: GamePresenterProtocol? { get set }
    // Methods
    func configureView(with model: GameViewModel)
    func updateTimer(time: String)
    func restartView()
}

// MARK: protocol - GamePresenterProtocol
protocol GamePresenterProtocol: AnyObject {
    var interactor: GameInteractorProtocol? { get set }
    var router: GameRouterProtocol? { get set }
    var view: GameViewProtocol? { get set }
    // Methods
    func viewDidLoad()
    func shouldStartGame()
    func shouldFinishGame()
}

// MARK: protocol - GameInteractorOutputProtocol
protocol GameInteractorOutputProtocol: AnyObject {
    func configureView(with model: GameViewModel)
    func shouldUpdateTimer(time: String)
    func timeDidEnded()
}

// MARK: protocol - GameInteractorProtocol
protocol GameInteractorProtocol: AnyObject {
    var presenter: GameInteractorOutputProtocol? { get set }
    var localDataManager: GameLocalDataManagerProtocol? { get set }
    //Methods
    func obtainConfiguration()
    func startGame()
    func finishGame()
}

// MARK: protocol - GameLocalDataManagerProtocol
protocol GameLocalDataManagerProtocol: AnyObject {
    func obtainGameView() -> GameViewModel
}

