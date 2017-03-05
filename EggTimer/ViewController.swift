//
//  ViewController.swift
//  EggTimer
//
//  Created by Ruslan on 17.02.17.
//  Copyright © 2017 Ruslan Petrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    private var timer = Timer()
    
    private var time = 300
    
    func setTime(_ newValue: Int) {
        time = newValue
        timerLabel.text = String(time)
    }
    
    func changeTimeBy(_ byValue: Int) {
        time += byValue
        timerLabel.text = String(time)
    }
    
    func processTimer() {
        if time > 1 {
            changeTimeBy(-1)
        } else {
            timer.invalidate()
        }
    }
    
    @IBAction private func playTimer(_ sender: UIBarButtonItem) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction private func pauseTimer(_ sender: UIBarButtonItem) {
        timer.invalidate()
    }
    
    @IBAction private func resetTimer(_ sender: UIBarButtonItem) {
        timer.invalidate()
        setTime(300)
    }
    
    @IBAction private func incrementBy10(_ sender: UIBarButtonItem) {
        changeTimeBy(10)
    }
    
    @IBAction private func decrementBy10(_ sender: UIBarButtonItem) {
        if time > 10 {
            changeTimeBy(-10)
        } else {
            timer.invalidate()
            setTime(0)
        }
    }
    
}

