//
// ViewController.swift
//
// Copyright (c) 2015 Teodor Patraş
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import EasyTipView

class ViewController: UIViewController, EasyTipViewDelegate {
    
    @IBOutlet weak var toolbarItem: UIBarButtonItem!
    @IBOutlet weak var smallContainerView: UIView!
    @IBOutlet weak var navBarItem: UIBarButtonItem!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        
        var preferences = EasyTipView.Preferences()
        
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.whiteColor()
        preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.Top
        
        EasyTipView.globalPreferences = preferences
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.toolbarItemAction()
    }
    
    func easyTipViewDidDismiss(tipView: EasyTipView) {
        print("\(tipView) did dismiss!")
    }
    
    @IBAction func barButtonAction(sender: UIBarButtonItem) {
        EasyTipView.show(forItem: self.navBarItem,
            withinSuperview: self.navigationController?.view,
            text: "Tip view for bar button item displayed within the navigation controller's view. Tap to dismiss.",
            delegate : self)
    }
    
    @IBAction func toolbarItemAction() {
        EasyTipView.show(forItem: self.toolbarItem, text: "EasyTipView is an easy to use tooltip view. Tap the buttons to see other tooltips.")
    }
    
    @IBAction func buttonAction(sender : UIButton) {
        switch sender {
        case buttonA:
            
            var preferences = EasyTipView.Preferences()
            preferences.drawing.backgroundColor = UIColor(hue:0.58, saturation:0.1, brightness:1, alpha:1)
            preferences.drawing.foregroundColor = UIColor.darkGrayColor()
            preferences.drawing.textAlignment = NSTextAlignment.Center
            preferences.drawing.borderWidth = 5
            preferences.drawing.borderColor = UIColor(red:0.92, green:0.46, blue:0.42, alpha:1)
            
            let view = EasyTipView(text: "Tip view within the green superview. Tap to dismiss.", preferences: preferences)
            view.show(forView: buttonA, withinSuperview: self.smallContainerView)
            
        case buttonB:
            
            var preferences = EasyTipView.globalPreferences
            preferences.drawing.foregroundColor = UIColor.whiteColor()
            preferences.drawing.font = UIFont(name: "HelveticaNeue-Light", size: 14)!
            preferences.drawing.textAlignment = NSTextAlignment.Justified
            
            EasyTipView.show(forView: self.buttonB,
                withinSuperview: self.navigationController?.view,
                text: "Tip view inside the navigation controller's view. Tap to dismiss!",
                preferences: preferences)
            
        case buttonC:
            
            var preferences = EasyTipView.globalPreferences
            preferences.drawing.backgroundColor = buttonC.backgroundColor!
            
            EasyTipView.show(forView: self.buttonC,
                withinSuperview: self.navigationController?.view,
                text: "This tip view cannot be presented with the arrow on the top position, so position bottom has been chosen instead. Tap to dismiss.",
                preferences: preferences)
            
        default:
            
            var preferences = EasyTipView.globalPreferences
            preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.Bottom
            preferences.drawing.font = UIFont.systemFontOfSize(14)
            preferences.drawing.backgroundColor = buttonD.backgroundColor!
            
            
            EasyTipView.show(forView: self.buttonD,
                text: "Tip view within the topmost window. Tap to dismiss.",
                preferences: preferences)
        }
    }
    
    func configureUI () {
        let color = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
        
        buttonA.backgroundColor = UIColor(hue:0.58, saturation:0.1, brightness:1, alpha:1)
        
        self.navigationController?.view.tintColor = color
        
        self.buttonB.backgroundColor = color
        self.smallContainerView.backgroundColor = color
    }
}

