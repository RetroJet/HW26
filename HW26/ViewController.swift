//
//  ViewController.swift
//  HW26
//
//  Created by brubru on 15.10.2024.
//

import UIKit

class ViewController: UIViewController {
    private let textLabel = UILabel()

	private let viewA = CustomView()
	private let viewB = CustomView()
	private let viewC = CustomView()
	private let viewD = CustomView()
	private let viewE = CustomView()
    
	override func viewDidLoad() {
		super.viewDidLoad()
		addSubViews()
		setupViews()
		addLabels()
        addViewDelegate()
        addViewName()
		setupLayout()
	}
}

//MARK: -> ICustomViewDelegate
extension ViewController: ICustomViewDelegate {
    func tappedView(_ view: String) {
        textLabel.text = view
    }
}

//MARK: -> Setup View
private extension ViewController {
	func addSubViews() {
		view.addSubview(viewA)
		
		viewA.addSubview(viewB)
		viewA.addSubview(viewC)
		viewB.addSubview(viewD)
		viewC.addSubview(viewE)
	}
	
	func setupViews() {
		view.backgroundColor = .white
		
		viewA.backgroundColor = .lightGray
		viewB.backgroundColor = .red
		viewC.backgroundColor = .blue
		viewD.backgroundColor = .yellow
		viewE.backgroundColor = .green
	}
	
	func addLabels() {
		addLabelToView(to: viewA, text: "A")
		addLabelToView(to: viewB, text: "B")
		addLabelToView(to: viewC, text: "C")
		addLabelToView(to: viewD, text: "D")
		addLabelToView(to: viewE, text: "E")
        addTextLabel(text: "Здесь будет название выбранной вью")
	}
    
    func addViewDelegate() {
        addDelegate(
            viewA,
            viewB,
            viewC,
            viewD,
            viewE
        )
    }
    
    func addViewName() {
        viewA.nameInstanceView = "A"
        viewB.nameInstanceView = "B"
        viewC.nameInstanceView = "C"
        viewD.nameInstanceView = "D"
        viewE.nameInstanceView = "E"
    }

}

// MARK: -> Setup Labels
private extension ViewController {
    func addTextLabel(text: String) {
        textLabel.text = text
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel.textColor = .black
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLabel)
    }
    
    func addLabelToView(to view: UIView, text: String) {
		let label = UILabel()
		label.text = text
		label.font = UIFont.boldSystemFont(ofSize: 15)
		label.textColor = .black
		label.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(label)
		
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
		])
	}
	
}

//MARK: -> AutoLayout
private extension ViewController {
	func setupLayout() {
		viewA.translatesAutoresizingMaskIntoConstraints = false
		viewB.translatesAutoresizingMaskIntoConstraints = false
		viewC.translatesAutoresizingMaskIntoConstraints = false
		viewD.translatesAutoresizingMaskIntoConstraints = false
		viewE.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			
			viewA.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
			viewA.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
			viewA.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
			viewA.heightAnchor.constraint(equalToConstant: 300),
			
			viewB.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewB.leadingAnchor.constraint(equalTo: viewA.leadingAnchor, constant: 20),
			viewB.widthAnchor.constraint(equalToConstant: 150),
			viewB.heightAnchor.constraint(equalToConstant: 150),
			
			viewC.topAnchor.constraint(equalTo: viewA.topAnchor, constant: 20),
			viewC.trailingAnchor.constraint(equalTo: viewA.trailingAnchor, constant: -20),
			viewC.widthAnchor.constraint(equalToConstant: 150),
			viewC.heightAnchor.constraint(equalToConstant: 150),
			
			viewD.bottomAnchor.constraint(equalTo: viewB.bottomAnchor, constant: -20),
			viewD.leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: 20),
			viewD.widthAnchor.constraint(equalToConstant: 100),
			viewD.heightAnchor.constraint(equalToConstant: 50),
			
			viewE.topAnchor.constraint(equalTo: viewC.topAnchor, constant: 60),
			viewE.centerXAnchor.constraint(equalTo: viewC.centerXAnchor),
			viewE.widthAnchor.constraint(equalToConstant: 80),
			viewE.heightAnchor.constraint(equalToConstant: 120),
            
            textLabel.bottomAnchor.constraint(equalTo: viewA.bottomAnchor, constant: 450),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}

