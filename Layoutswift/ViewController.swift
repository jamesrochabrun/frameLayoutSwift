//
//  ViewController.swift
//  Layoutswift
//
//  Created by James Rochabrun on 10/27/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let redView = UIView()
    let yellowView = UIView()
    let greenView = UIView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
        yellowView.backgroundColor = UIColor.yellow
        self.view.addSubview(yellowView)
        greenView.backgroundColor = UIColor.green
        self.view.addSubview(greenView);
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //you can decide the space between UI elements and make it consistent using just one variable, that let you change it in just one place and change it for all your views.
        let innerSpace : CGFloat = 20
        let mainViewHeight : CGFloat = self.view.frame.size.height
        let mainViewWidth : CGFloat = self.view.frame.size.width
        //the block will be the 40% of the views height, you can adjust it at any time!
        let subViewHeight : CGFloat = mainViewHeight * 0.4;
        //the block will be the 80 % of the whole vie, you can adjust it at any time.
        var subViewWidth : CGFloat = mainViewWidth * 0.8;
        
        //This view will be your starting reference, always start thinking like that.
        var frame = redView.frame;
        frame.size.width = subViewWidth
        frame.size.height = subViewHeight
        frame.origin.x  = (mainViewWidth - frame.size.width)/2
        //What it's going on here? ...
        //1 get the height of two blocks plus the height of the innerspace
        //2 substract it to the whole height and dividing it by 2 
        //3 finally don't forget to add the value of the maxY that you substract at the beginig, that will give you a Y coordinate that will center your views!
        frame.origin.y = (mainViewHeight - (subViewHeight * 2 + innerSpace))/2
        redView.frame = frame;
        
        //Whats going on here? we are changing the width of the block, now we want less wider blocks so what to do? in this case you just want two so..
        //1 take the width of the view that you used as a starting reference
        //2 substract the amount of spacing
        // divide it by 2 (or more if you have more views)
        subViewWidth = (redView.frame.size.width - innerSpace)/2
        frame = yellowView.frame
        frame.size.width = subViewWidth;
        frame.size.height = subViewHeight;
        frame.origin.x = redView.frame.minX
        frame.origin.y = redView.frame.maxY + innerSpace
        yellowView.frame = frame;
        
        frame = greenView.frame
        frame.size.width = subViewWidth
        frame.size.height = subViewHeight
        frame.origin.x = yellowView.frame.maxX + innerSpace
        frame.origin.y = redView.frame.maxY + innerSpace
        greenView.frame = frame

    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

