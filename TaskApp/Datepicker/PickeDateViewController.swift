//
//  PickeDateViewController.swift
//  TaskApp
//
//  Created by CV on 1/21/22.
//

import UIKit
import Foundation

class PickeDateViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var oneView: UIView!
    
    @IBOutlet weak var twoVIew: UIView!
    
    @IBOutlet weak var demoBtn: UIButton!
    @IBOutlet var txtValue: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        demoBtn.isUserInteractionEnabled = false
        demoBtn.backgroundColor = .gray
        // Do any additional setup after loading the view.
        txtValue.delegate = self
      
//        print("\( "2022-03-01T00:00:00.000Z" ?? "00:00:00")")
        
        let now = Date()
        let soon = Date().addingTimeInterval(259200)

        now == soon
        now != soon
        now < soon
        now > soon
        
        
        let time = "2022-03-01T00:00:00.000Z"
        let timerequiredUTC = time.toDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")?.addingTimeInterval(259200)
        let timeUTC = timerequiredUTC?.toString(dateFormat: "yyyy-MM-dd", isUTC: false)
        print(timeUTC ?? "","addingTimeInterval")
        
        let timerequiredUTCset = time.toDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        let timeUTCset = timerequiredUTCset?.toString(dateFormat: "yyyy-MM-dd", isUTC: false)
        print(timeUTCset ?? "","response")
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
//        let date: Date? = dateFormatterGet.date(from: "\(time)")
//        print(dateFormatterPrint.string(from: date ?? Date())) // Feb 01,2018
//
//
//        if dateFormatterPrint.string(from: date ?? Date()) == timeUTC{
//            print("equal")
//        }else{
//            print("not equal")
//        }
        if timeUTC == timeUTCset{
            print("equal")

            oneView.isHidden = true
            twoVIew.isHidden = false
        }else{
            oneView.isHidden = false
            twoVIew.isHidden = true
        }
        
    }
    @IBAction func demoClicked(_ sender: Any) {
    print("Ciclked")
    
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        demoBtn.isUserInteractionEnabled = true
        demoBtn.backgroundColor = .red
       }

}


extension String{
    func isBackSpace()->Bool{ //check if backspace
        let  char = self.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        
        if (isBackSpace == -92) {
            return true
        }
        return false
    }
    
   func formattedNumber() -> String {
           let cleanPhoneNumber = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
           let mask = "XXX-XXX-XXXX"

           var result = ""
           var index = cleanPhoneNumber.startIndex
           for ch in mask where index < cleanPhoneNumber.endIndex {
               if ch == "X" {
                   result.append(cleanPhoneNumber[index])
                   index = cleanPhoneNumber.index(after: index)
               } else {
                   result.append(ch)
               }
           }
           return result
       }
    
    func getDateFromString(formate: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = formate //"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self) ?? Date()
    }
    
    func convertToDate( dateFormat format  : String ) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: self)!
    }
    
    
    func convertDateFormate(currentFormate: String, requiredFormate: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = currentFormate
        if let date = formatter.date(from: self) {
            formatter.dateFormat = requiredFormate
            return formatter.string(from: date)
        }
        return ""
    }
    
    func toDate( dateFormat format  : String , isUTC: Bool = true) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = isUTC ? TimeZone(abbreviation: "UTC") : TimeZone(identifier: TimeZone.current.identifier)
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    
    var parseJSONString: AnyObject? {
            let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
            if let jsonData = data
            {
                // Will return an object or nil if JSON decoding fails
                do
                {
                    let message = try JSONSerialization.jsonObject(with: jsonData, options:.mutableContainers)
                    if let jsonResult = message as? NSMutableArray {
                        return jsonResult //Will return the json array output
                    } else if let jsonResult = message as? NSMutableDictionary {
                        return jsonResult //Will return the json dictionary output
                    } else {
                        return nil
                    }
                }
                catch let error as NSError
                {
                    return nil
                }
            }
            else
            {
                return nil
            }
        }
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func stringToDateConversions(dateString: String, fromDateFormate: String, toDateFormate: String) -> String{
        let dateString = dateString
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromDateFormate//"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = Locale.init(identifier: "UTC")

        let dateObj = dateFormatter.date(from: dateString)

        dateFormatter.dateFormat = toDateFormate//"EEE HH:mm a"
        return (dateFormatter.string(from: dateObj ?? Date()))
    }
//
//    func containsEmoji() -> Bool {
//        for scalar in unicodeScalars {
//            if !scalar.properties.isEmoji { continue }
//            return true
//        }
//
//        return false
//    }
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9,// Special Characters
            0x1D000...0x1F77F,          // Emoticons
            0x2100...0x27BF,            // Misc symbols and Dingbats
            0xFE00...0xFE0F,            // Variation Selectors
            0x1F900...0x1F9FF:          // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
       }
    var minusEmojis: String {
        let allowedCharacters = CharacterSet.alphanumerics
        let filter = self.filter { (c) -> Bool in
            return !c.unicodeScalars.contains(where: { !allowedCharacters.contains($0)})
        }
        return filter
      }
   
}
extension Date{
    
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    func convertTostring( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func getElapsedInterval() -> String {
        let interval =  Calendar.current.dateComponents([.year, .month, .day ,.hour, .minute, .second], from: self, to: Date())
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)"  + " year ago" :
                "\(year)"  +  " years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " month ago" :
                "\(month)" + " months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " day ago" :
                "\(day)" + " days ago"
        }
        else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " hour ago" :
                "\(hour)" + " hours ago"
        }
        else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " minute ago" :
                "\(minute)" + " minutes ago"
        }
        else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " second ago" :
                "\(second)" + " seconds ago"
        }else {
            return " just now"
        }
    }
    
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    
    func toString( dateFormat format: String ,isUTC: Bool) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: Locale.current.identifier)
        if isUTC { dateFormatter.timeZone = TimeZone(abbreviation: "UTC")}
        dateFormatter.dateFormat = format
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: self)
    }
    
    
    func dateFormatChanges(date: Date) -> String{
        let calendar = Calendar.current

        let day = calendar.component(.day, from: date)
        let _: String

        switch day {
        case 11...13: return "th"
        default:
            switch day % 10 {
            case 1: return "st"
            case 2: return "nd"
            case 3: return "rd"
            default: return "th"
            }
        }
        }
}
