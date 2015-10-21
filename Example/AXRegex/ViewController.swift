//
//  ViewController.swift
//  AXRegex
//
//  Created by Arthur XU on 10/15/2015.
//  Copyright (c) 2015 Arthur XU. All rights reserved.
//

import UIKit
import AXRegex

class ViewController: UIViewController, UITextViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource {
    
    // MARK: - Variable -
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var regexPicker: UIPickerView!
    @IBOutlet weak var resultTable: UITableView!
    
    var regexResult: RegexResult?
    var regexPattern: String = RegexPattern.HtmlTag
    
    // MARK: - Life Cycle -
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.refreshResult()
    }
    
    // MARK: - Private Methods -
    func refreshResult() {
        self.regexResult = textView.text =~ regexPattern
        resultTable.reloadData()
        if let row = self.regexResult?.matches.count where row>0 {
            resultTable.scrollToRowAtIndexPath(NSIndexPath(forRow: row-1, inSection: 0), atScrollPosition: .None, animated: true)
        }
    }
    
    // MARK: - Delegate -
    // MARK: UITextViewDelegate
    func textViewDidChange(textView: UITextView) {
        self.refreshResult()
    }
    
    // MARK: UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    // MARK: UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var title: String
        switch row {
        case 0:
            title = "Html Tag"
        case 1:
            title = "Email"
        case 2:
            title = "IP Address"
        case 3:
            title = "WebSite"
        case 4:
            title = "Number"
        case 5:
            title = "Chinese"
        default:
            title = ""
        }
        return title
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            regexPattern = RegexPattern.HtmlTag
        case 1:
            regexPattern = RegexPattern.Email
        case 2:
            regexPattern = RegexPattern.IPAddress
        case 3:
            regexPattern = RegexPattern.WebSite
        case 4:
            regexPattern = RegexPattern.Number
        case 5:
            regexPattern = RegexPattern.Chinese
        default:
            regexPattern = ""
        }
        self.refreshResult()
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let result = regexResult else {return 0}
        return result.matches.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        if let match=regexResult?.matches[indexPath.row], label=cell.textLabel {
            label.text = match.content
        }
        return cell
    }
}
