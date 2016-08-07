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
    var regexPattern: String = RegexPattern.HtmlTagPattern
    
    // MARK: - Life Cycle -
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.refreshResult()
    }
    
    // MARK: - Private Methods -
    func refreshResult() {
        self.regexResult = textView.text =~ regexPattern
        resultTable.reloadData()
        if let row = self.regexResult?.matches.count where row>0 {
            resultTable.scrollToRow(at: IndexPath(row: row-1, section: 0), at: .none, animated: true)
        }
    }
    
    // MARK: - Delegate -
    // MARK: UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        self.refreshResult()
    }
    
    // MARK: UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 6
    }
    
    // MARK: UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
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
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            regexPattern = RegexPattern.HtmlTagPattern
        case 1:
            regexPattern = RegexPattern.EmailPattern
        case 2:
            regexPattern = RegexPattern.IPAddressPattern
        case 3:
            regexPattern = RegexPattern.WebSitePattern
        case 4:
            regexPattern = RegexPattern.NumberPattern
        case 5:
            regexPattern = RegexPattern.ChinesePattern
        default:
            regexPattern = ""
        }
        self.refreshResult()
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let result = regexResult else {return 0}
        return result.matches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        if let match=regexResult?.matches[indexPath.row], label=cell.textLabel {
            label.text = match.content
        }
        return cell
    }
}
