//
//  FundamentsView.swift
//  Lojong-Test
//
//  Created by João Tribuzy on 25/03/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class FundamentsView: UIView{
    
    var model: FundamentModel = {
        return FundamentModel.shared
    }()
    
    // MARK: - View Lifecycle
    init() {
        super.init(frame: .zero)
        
        self.style()
        self.autolayout()
        
        refreshPositionAndClicked()
        
        scrollToEnd()
        
        backButtom.addTarget(self, action: #selector(dismissFundamentViewController), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    let topView: UIView = UIView()
    let backButtom: UIButton = UIButton()
    let fundamentLabel: UILabel = UILabel()
    
    let scrollView: UIScrollView = UIScrollView()
    let imageBackGround: UIImageView = UIImageView()
    
    var listViewClick: [UIButton] = []
    lazy var tags: Int = 0
    var listCheckedDays: [Bool] = []
    
    var elephantPosition: [UIImageView] = []
    var elephantLastPosition: Int = 0
}

extension FundamentsView: LojongCustomView{
    func style() {
        self.backgroundColor = UIColor.init(red: 101, green: 163, blue: 126)
        
        // backButtom
        backButtom.setImage(UIImage(named: "back-buttom"), for: .normal)
        
        // fundamentLabel
        fundamentLabel.text = String("fundamentos").uppercased()
        fundamentLabel.font = UIFont(name: "Asap-Bold", size: 20)
        fundamentLabel.textColor = .white
        
        // topView
        topView.backgroundColor = UIColor.init(red: 118, green: 189, blue: 148)
        topView.dropShadow()
        
        // scrollView
        scrollView.backgroundColor = UIColor.init(red: 155, green: 218, blue: 94)
        scrollView.bounces = false
        
        // imageViewBackGround
        imageBackGround.contentMode = .scaleAspectFit
        imageBackGround.isUserInteractionEnabled = true
        imageBackGround.image = UIImage(named: "fundaments")
        
        // listViewClick
        for current in 0...30 {
            let day: UIButton = {
                let buttom = UIButton()
                buttom.backgroundColor = .clear
                return buttom
            }()
            
            
            let dayLabel: UILabel = UILabel()
            dayLabel.text = "Dia \(current + 1)"
            dayLabel.font = UIFont(name: "Asap-Medium", size: 11)
            
            day.sv(dayLabel)
            day.contentMode = .scaleAspectFit
            
            switch current {
            case 0,1,3,5,7,8,9,11:
                day.setImage(UIImage(named: "vertical-ground"), for: .normal)
                dayLabel.textColor = UIColor.init(red: 139, green: 87, blue: 41)
            case 2,4,6,10:
                day.setImage(UIImage(named: "horizontal-ground"), for: .normal)
                dayLabel.textColor = UIColor.init(red: 139, green: 87, blue: 41)
            case 12,13,14,15,16,18,19,20,21,22,23,25,26,27,29,30:
                day.setImage(UIImage(named: "vertical-water"), for: .normal)
                dayLabel.textColor = .white
            case 17,24,28:
                day.setImage(UIImage(named: "horizontal-water"), for: .normal)
                dayLabel.textColor = .white
            default:
                break
            }
            day.isUserInteractionEnabled = true
            day.tag = tags
            tags += 1
            listCheckedDays.append(false)
            day.addTarget(self, action: #selector(changeBackground), for: .touchUpInside)
            listViewClick.append(day)
        }
        
        // elephantPosition
        for current in 0...31{
            let elephantImage: UIImageView = UIImageView()
            
            switch current {
            case 0...11:
                elephantImage.image = UIImage(named: "elephant-ground")
            case 12...31:
                elephantImage.image = UIImage(named: "elephant-water")
            default:
                break
            }
            
            elephantPosition.append(elephantImage)
        }
    }
    
    @objc func changeBackground(_ sender: UIButton){
        switch sender.tag {
        case 0,1,3,5,7,8,9,11:
            sender.setImage(UIImage(named: "vertical-ground-unlocked"), for: .normal)
            listCheckedDays[sender.tag]  = true
            model.clickedButtons.append(sender.tag)
            model.savePositionAndClicked()
            refreshElephantPosition()
        case 2,4,6,10:
            sender.setImage(UIImage(named: "horizontal-ground-unlocked"), for: .normal)
            listCheckedDays[sender.tag]  = true
            refreshElephantPosition()
        case 12,13,14,15,16,18,19,20,21,22,23,25,26,27,29,30:
            sender.setImage(UIImage(named: "vertical-water-unlocked"), for: .normal)
            listCheckedDays[sender.tag]  = true
            if sender.tag == 30{
                elephantPosition[30].isHidden = true
            } else{
                refreshElephantPosition()
            }
        case 17,24,28:
            sender.setImage(UIImage(named: "horizontal-water-unlocked"), for: .normal)
            listCheckedDays[sender.tag]  = true
        default:
            refreshElephantPosition()
            break
        }
        print(listCheckedDays)
        print(elephantLastPosition)
    }
    
    private func refreshElephantPosition(){
        for (index,position) in listCheckedDays.enumerated(){
            if position == true{
                continue
            } else{
                elephantLastPosition = index
                model.lastPosition = elephantLastPosition
                model.savePositionAndClicked()
                break
            }
        }
        for (index,_) in listViewClick.enumerated(){
            if elephantLastPosition == index{
                elephantPosition[index].isHidden = false
            } else{
                elephantPosition[index].isHidden = true
            }
        }
    }
    
    func autolayout() {
        self.top(0).right(0).bottom(0).left(0)
        
        
        
        // topview
        sv(topView)
        topView.top(0).right(0).left(0).height(70)
        topView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        
        // backButtom
        topView.sv(backButtom, fundamentLabel)
        backButtom.top(10).bottom(10).left(20)
        backButtom.Height == backButtom.Width
        
        fundamentLabel.centerInContainer()
        
        // scrollView
        sv(scrollView)
        scrollView.right(0).bottom(0).left(0)
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: (7371/640) * UIScreen.main.bounds.width)
        
        scrollView.sv(imageBackGround)
        imageBackGround.width(UIScreen.main.bounds.width).height((7371/640) * UIScreen.main.bounds.width)
        imageBackGround.Width == self.Width
        
        // listViewClick
        for current in 0...30{
        
            imageBackGround.sv(listViewClick[current])
            
            switch current {
            case 0,1,3,5,7,8,9,11:
                listViewClick[current].width(widthPointsTransform(76))
                listViewClick[current].height(heightPointsTranform(81))
                listViewClick[current].subviews[0].centerHorizontally().bottom(heightPointsTranform(23))
            case 2,4,6,10:
                listViewClick[current].width(widthPointsTransform(75))
                listViewClick[current].height(heightPointsTranform(72))
                listViewClick[current].subviews[0].centerHorizontally().bottom(heightPointsTranform(20))
            case 12,13,14,15,16,18,19,20,21,22,23,25,26,27,29,30:
                listViewClick[current].width(widthPointsTransform(85.5))
                listViewClick[current].height(heightPointsTranform(85.5))
                listViewClick[current].subviews[0].centerHorizontally().bottom(heightPointsTranform(23))
            case 17,24,28:
                listViewClick[current].width(widthPointsTransform(85))
                listViewClick[current].height(heightPointsTranform(86.5))
                listViewClick[current].subviews[0].centerHorizontally().bottom(heightPointsTranform(25))
            default:
                break
            }
            
            switch current {
            case 0:
                listViewClick[current].right(widthPointsTransform(77.3))
                listViewClick[current].bottom(heightPointsTranform(55))
            case 1:
                listViewClick[current].right(widthPointsTransform(77.3))
                listViewClick[current].bottom(heightPointsTranform(161))
            case 2:
                listViewClick[current].right(widthPointsTransform(167))
                listViewClick[current].bottom(heightPointsTranform(253.5))
            case 3:
                listViewClick[current].left(widthPointsTransform(36.5))
                listViewClick[current].bottom(heightPointsTranform(332))
            case 4:
                listViewClick[current].centerHorizontally()
                listViewClick[current].bottom(heightPointsTranform(427.5))
            case 5:
                listViewClick[current].right(widthPointsTransform(31))
                listViewClick[current].bottom(heightPointsTranform(508.5))
            case 6:
                listViewClick[current].right(widthPointsTransform(120))
                listViewClick[current].bottom(heightPointsTranform(605.5))
            case 7:
                listViewClick[current].right(widthPointsTransform(212))
                listViewClick[current].bottom(heightPointsTranform(697.5))
            case 8:
                listViewClick[current].right(widthPointsTransform(212))
                listViewClick[current].bottom(heightPointsTranform(798))
            case 9:
                listViewClick[current].right(widthPointsTransform(212))
                listViewClick[current].bottom(heightPointsTranform(898))
            case 10:
                listViewClick[current].right(widthPointsTransform(137))
                listViewClick[current].bottom(heightPointsTranform(1009.5))
            case 11:
                listViewClick[current].right(widthPointsTransform(62))
                listViewClick[current].bottom(heightPointsTranform(1113.5))
            case 12:
                listViewClick[current].right(widthPointsTransform(221))
                listViewClick[current].bottom(heightPointsTranform(1420.5))
            case 13:
                listViewClick[current].right(widthPointsTransform(221))
                listViewClick[current].bottom(heightPointsTranform(1544))
            case 14:
                listViewClick[current].right(widthPointsTransform(98.5))
                listViewClick[current].bottom(heightPointsTranform(1720))
            case 15:
                listViewClick[current].left(widthPointsTransform(28.5))
                listViewClick[current].bottom(heightPointsTranform(1886))
            case 16:
                listViewClick[current].left(widthPointsTransform(28.5))
                listViewClick[current].bottom(heightPointsTranform(2009))
            case 17:
                listViewClick[current].right(widthPointsTransform(166))
                listViewClick[current].bottom(heightPointsTranform(2106))
            case 18:
                listViewClick[current].right(widthPointsTransform(79.5))
                listViewClick[current].bottom(heightPointsTranform(2190))
            case 19:
                listViewClick[current].right(widthPointsTransform(79.5))
                listViewClick[current].bottom(heightPointsTranform(2288))
            case 20:
                listViewClick[current].right(widthPointsTransform(79.5))
                listViewClick[current].bottom(heightPointsTranform(2388))
            case 21:
                listViewClick[current].right(widthPointsTransform(202))
                listViewClick[current].bottom(heightPointsTranform(2550))
            case 22:
                listViewClick[current].right(widthPointsTransform(40))
                listViewClick[current].bottom(heightPointsTranform(2705))
            case 23:
                listViewClick[current].right(widthPointsTransform(40))
                listViewClick[current].bottom(heightPointsTranform(2834))
            case 24:
                listViewClick[current].right(widthPointsTransform(130))
                listViewClick[current].bottom(heightPointsTranform(2931.5))
            case 25:
                listViewClick[current].left(widthPointsTransform(68.5))
                listViewClick[current].bottom(heightPointsTranform(3024))
            case 26:
                listViewClick[current].left(widthPointsTransform(68.5))
                listViewClick[current].bottom(heightPointsTranform(3140))
            case 27:
                listViewClick[current].left(widthPointsTransform(68.5))
                listViewClick[current].bottom(heightPointsTranform(3262))
            case 28:
                listViewClick[current].right(widthPointsTransform(134))
                listViewClick[current].bottom(heightPointsTranform(3359))
            case 29:
                listViewClick[current].right(widthPointsTransform(40))
                listViewClick[current].bottom(heightPointsTranform(3467))
            case 30:
                listViewClick[current].right(widthPointsTransform(40))
                listViewClick[current].bottom(heightPointsTranform(3589))
            default:
                break
            }
        
            
        
        }
        
        // elephantPosition
        for current in 0...31{
            imageBackGround.sv(elephantPosition[current])
            elephantPosition[current].tag = current
            elephantPosition[current].contentMode = .scaleAspectFit
            elephantPosition[current].isHidden = true
            switch current {
            case 0...11:
                elephantPosition[current].width(widthPointsTransform(48))
                elephantPosition[current].height(heightPointsTranform(37))
            case 12...31:
                elephantPosition[current].width(widthPointsTransform(44))
                elephantPosition[current].height(heightPointsTranform(53))
            default:
                break
            }
            
            switch current {
            case 0:
                elephantPosition[current].bottom(heightPointsTranform(13))
                elephantPosition[current].right(widthPointsTransform(87))
                elephantPosition[current].isHidden = false
            case 1:
                elephantPosition[current].bottom(heightPointsTranform(128))
                elephantPosition[current].right(widthPointsTransform(87))
            case 2:
                elephantPosition[current].bottom(heightPointsTranform(253))
                elephantPosition[current].right(widthPointsTransform(100))
            case 3:
                elephantPosition[current].bottom(heightPointsTranform(270))
                elephantPosition[current].right(widthPointsTransform(241))
            case 4:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(439))
                elephantPosition[current].right(widthPointsTransform(252))
            case 5:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(460))
                elephantPosition[current].right(widthPointsTransform(70))
            case 6:
                elephantPosition[current].bottom(heightPointsTranform(606))
                elephantPosition[current].right(widthPointsTransform(52))
            case 7:
                elephantPosition[current].bottom(heightPointsTranform(645))
                elephantPosition[current].right(widthPointsTransform(203))
            case 8:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(772))
                elephantPosition[current].right(widthPointsTransform(225))
            case 9:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(870))
                elephantPosition[current].right(widthPointsTransform(225))
            case 10:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(1008))
                elephantPosition[current].right(widthPointsTransform(219))
            case 11:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(1048))
                elephantPosition[current].right(widthPointsTransform(83))
            case 12:
                elephantPosition[current].bottom(heightPointsTranform(1350))
                elephantPosition[current].right(widthPointsTransform(141))
            case 13:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 87 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(1498))
                elephantPosition[current].right(widthPointsTransform(244))
            case 14:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(1660))
                elephantPosition[current].right(widthPointsTransform(184))
            case 15:
                elephantPosition[current].bottom(heightPointsTranform(1820))
                elephantPosition[current].right(widthPointsTransform(194))
            case 16:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 87 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(1965))
                elephantPosition[current].right(widthPointsTransform(285))
            case 17:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 45 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(2113))
                elephantPosition[current].right(widthPointsTransform(260))
            case 18:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 45 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(2141))
                elephantPosition[current].right(widthPointsTransform(113))
            case 19:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 87 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(2253))
                elephantPosition[current].right(widthPointsTransform(103))
            case 20:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 87 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(2351))
                elephantPosition[current].right(widthPointsTransform(103))
            case 21:
                elephantPosition[current].bottom(heightPointsTranform(2480))
                elephantPosition[current].right(widthPointsTransform(155))
            case 22:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1)
                elephantPosition[current].bottom(heightPointsTranform(2645))
                elephantPosition[current].right(widthPointsTransform(115))
            case 23:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 87 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(2781))
                elephantPosition[current].right(widthPointsTransform(65))
            case 24:
                elephantPosition[current].transform = CGAffineTransform(scaleX: 1, y: 1).rotated(by: 45 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(2928))
                elephantPosition[current].right(widthPointsTransform(68))
            case 25:
                elephantPosition[current].transform = CGAffineTransform(scaleX: 1, y: 1).rotated(by: 45 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(2958))
                elephantPosition[current].right(widthPointsTransform(215))
            case 26:
                elephantPosition[current].transform = CGAffineTransform(scaleX: 1, y: 1).rotated(by: 90 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(3098))
                elephantPosition[current].right(widthPointsTransform(240))
            case 27:
                elephantPosition[current].transform = CGAffineTransform(scaleX: 1, y: 1).rotated(by: 90 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(3216))
                elephantPosition[current].right(widthPointsTransform(240))
            case 28:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 45 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(3360))
                elephantPosition[current].right(widthPointsTransform(227))
            case 29:
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 45 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(3388))
                elephantPosition[current].right(widthPointsTransform(78))
            case 30:
//                elephantPosition[current].transform = CGAffineTransform(rotationAngle: 45)
                elephantPosition[current].transform = CGAffineTransform(scaleX: -1, y: 1).rotated(by: 80 * .pi/180)
                elephantPosition[current].bottom(heightPointsTranform(3541))
                elephantPosition[current].right(widthPointsTransform(62))
            default:
                break
            }
        }
        
    }
    
    private func widthPointsTransform(_ points: CGFloat) -> CGFloat{
        return (points/375) * scrollView.contentSize.width
    }
    
    private func heightPointsTranform(_ points: CGFloat) -> CGFloat{
        return (points/4315.43) * scrollView.contentSize.height
    }
    @objc private func dismissFundamentViewController(){

        NotificationCenter.default.post(name: .LojongDismissFundamentViewController, object: nil)
    }
    
    func scrollToEnd(){
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    // MARK: Data
    private func refreshPositionAndClicked(){
        model.getPositionAndClicked()
        
        for num in 0...31{
            if elephantPosition[num].tag == model.lastPosition{
                elephantPosition[num].isHidden = false
            } else{
                elephantPosition[num].isHidden = true
            }
        }
    }
}
