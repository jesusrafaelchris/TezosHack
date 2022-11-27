//
//  ViewController.swift
//  TezosHackerHouse
//
//  Created by Christian Grinling on 26/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var bids = [bid]()
    
    lazy var topBarView: TopBarView = {
        let topBarView = TopBarView()
        return topBarView
    }()
    
    lazy var boxView: ExperienceView = {
        let view = ExperienceView()
        return view
    }()
    
    lazy var mynftView: UILabel = {
        let text = UILabel()
        text.layout(colour: .black, size: 22, text: "Current NFT Bids", bold: true)
        return text
    }()
    
    lazy var bidCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(BidCell.self, forCellWithReuseIdentifier: "bidCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        boxView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didtapbox)))
        setUpView()
        bids = [
            bid(image: "NFT1", name: "Tezos Owl #4712", hash: "op44hawk78gcTAxtL7C...", price: "300 XTZ"),
            bid(image: "NFT2", name: "Tezos Owl #2951", hash: "onnjomhg6aSNQ2M3Co9...", price: "250 XTZ"),
            bid(image: "NFT3", name: "Tezos Owl #8124", hash: "ooiY8eCqWyWYPrjn9Hh...", price: "200 XTZ"),
            bid(image: "NFT4", name: "Tezos Owl #4712", hash: "onyH1geJG7fsZRsxvv4...", price: "300 XTZ"),
            bid(image: "NFT5", name: "Tezos Owl #1094", hash: "opFkuxsy1LbKaLHEpJf...", price: "350 XTZ"),
            bid(image: "NFT6", name: "Tezos Owl #0004", hash: "ooczbkFZoTFFciS676e...", price: "500 XTZ")
        ]
        
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
    }
    
    @objc func didtapbox() {
        
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "ARView") as! ViewController
            destinationVC.modalPresentationStyle = .fullScreen
            self.navigationController?.present(destinationVC, animated: false)
        }
    }
    
    func setUpView(){
        view.addSubview(topBarView)
        view.addSubview(boxView)
        view.addSubview(mynftView)
        view.addSubview(bidCollectionView)
        
        topBarView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        boxView.anchor(top: topBarView.bottomAnchor, paddingTop: 34, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 30, right: view.rightAnchor, paddingRight: 30, width: 0, height: 60)
        
        mynftView.anchor(top: boxView.bottomAnchor, paddingTop: 35, bottom: nil, paddingBottom: 0, left: boxView.leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        bidCollectionView.anchor(top: mynftView.bottomAnchor, paddingTop: 15, bottom: view.bottomAnchor, paddingBottom: 0, left: mynftView.leftAnchor, paddingLeft: 0, right: boxView.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "bidCell",
            for: indexPath) as? BidCell else { return UICollectionViewCell() }
        let data = bids[indexPath.item]
        cell.configure(data: data)
        cell.backgroundColor = .clear
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = CGFloat(56)//view.bounds.height / 15
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let BD = BiddingViewController()
        navigationController?.present(BD, animated: true)
    }
}
