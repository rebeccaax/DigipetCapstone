//  CloseUpGame.swift
//  DigipetCapstone
//
//  Created by Eunbi Baek on 3/1/19.
//  Copyright © 2019 Katie Katz. All rights reserved.
//


import Foundation
import UIKit
import SpriteKit
import GameplayKit
import Speech

class Closeup {
    var done: Bool = false
    
    var name : String
    var ch : [String]
    var fr : [String]
    var sp : [String]
    var image : UIImage
    var closeup : UIImage
    
    init?(name : String, ch : [String], fr : [String], sp : [String], imName : String){
        self.name = name
        self.ch = ch
        self.fr = fr
        self.sp = sp
        self.image = UIImage(named: imName)!
        self.closeup = UIImage(named: (imName + "Closeup"))!
    }
    
}

class CloseUpGame : UIViewController, SFSpeechRecognizerDelegate {
    var lang = String()
    var langArray = Int()
    let audioEngine = AVAudioEngine()
    var speechRecognizer = SFSpeechRecognizer()
    var request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isRecording = false
    
    let images = [Closeup(name: "run", ch: ["跑步"], fr: ["lait"], sp: ["leche"], imName: "run"), Closeup(name: "swim", ch: ["游泳"], fr: ["pain"], sp: ["pan"], imName: "swim"), Closeup(name: "baseball", ch: ["棒球"], fr: ["oeuf"], sp: ["huevo"], imName: "baseball"), Closeup(name: "pingpong", ch: ["乒乓球"], fr: ["riz"], sp: ["arroz"], imName: "pingpong"), Closeup(name: "tennis", ch: ["网球"], fr: ["fromage"], sp: ["queso"], imName: "tennis"), Closeup(name: "basketball", ch: ["篮球"], fr: ["viande"], sp: ["carne"], imName: "basketball"), Closeup(name: "kick", ch: ["踢"], fr: ["dessert", "gâteau"], sp: ["postre", "pastel"], imName: "kick"), Closeup(name: "face", ch: ["脸"], fr: ["soupe"], sp: ["sopa"], imName: "face"), Closeup(name: "soccer", ch: ["足球"], fr: ["soupe"], sp: ["sopa"], imName: "soccer")]
    
    var resultCount = [0, 0, 0, 0, 0, 0, 0, 0]
    
    @IBOutlet weak var textView: UIView!
    
    var randArray : [Int] = []
    var detectedText : String = ""
    var talked : Bool = false
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var explainText: UILabel!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var talkButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func talkButtonTouched(_ sender: Any) {
        if isRecording == true {
            nextButton.isEnabled = true
            request.endAudio()
            request = SFSpeechAudioBufferRecognitionRequest()
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            recognitionTask?.cancel()
            isRecording = false
            talked = true
            verifyGuess()
        } else {
            nextButton.isEnabled = false
            self.recordAndRecognizeSpeech()
            isRecording = true
        }
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        if !talked {
            let index = randArray.remove(at: 0)
            randArray.insert(index, at: Int(arc4random_uniform(UInt32(randArray.count-1) + 1)))
            if resultCount[index] == 0{
                resultCount[index] = 2
            }
        }
        setGuess()
    }
    
    
    func recordAndRecognizeSpeech() {
        guard let node = audioEngine.inputNode as Optional else { return }
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 2048, format: recordingFormat) {buffer, _ in
            self.request.append(buffer)
        }
        
        audioEngine.prepare()
        do {
            sleep(1)
            try audioEngine.start()
        } catch {
            return print(error)
        }
        
        guard let myRecognizer = SFSpeechRecognizer() else {
            return
        }
        if !myRecognizer.isAvailable {
            return
        }
        
        recognitionTask = speechRecognizer?.recognitionTask(with: request, resultHandler: { result, error in
            if result != nil {
                if let result = result {
                    let best = result.bestTranscription.formattedString.lowercased()
                    print(best)
                    print("hewwo!")
                    self.detectedText = best
                }
            } else if let error = error {
                print(error)
            }
        })
    }
    
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.talkButton.isEnabled = true
                case .denied:
                    self.talkButton.isEnabled = false
                    self.answerText.text = "Error!"
                    self.explainText.text = "User denied access"
                case .restricted:
                    self.talkButton.isEnabled = false
                    self.answerText.text = "Error!"
                    self.explainText.text = "Speech recognition restricted"
                case .notDetermined:
                    self.talkButton.isEnabled = false
                    self.answerText.text = "Error!"
                    self.explainText.text = "Speech recognition not yet authorized"
                }
            }
        }
    }
    
    func setGuess() {
        if randArray.count == 0 {
            //display ending
            nextButton.isEnabled = false
            print("done!")
            imageView.image = UIImage(named: "congrats")
            answerText.layer.opacity = 1
            answerText.text = "Congrats!"
            var totalRight = 0
            for res in resultCount {
                if res == 1{
                    totalRight += 1
                }
            }
            explainText.text = String(totalRight) + "/12 Correct\nHit back arrow to return to lessons"
        } else {
            nextButton.imageView?.image = UIImage(named: "skipButton")
            answerText.layer.opacity = 0
            explainText.text = "What is that?"
            detectedText = ""
            let index = randArray[0]
            let cur = images[index]
            talked = false
            talkButton.isEnabled = true
            imageView.image = cur?.closeup
        }
    }
    
    func verifyGuess() {
        let index = randArray[0]
        let guess = images[index]
        talkButton.isEnabled = false
        randArray.remove(at: 0)
        answerText.layer.opacity = 1
        nextButton.imageView?.image = UIImage(named: "nextButton")
        var option = [String]()
        var looper = false
        switch lang {
        case "ch":
            explainText.text = "That is \"" + (guess?.ch[0])! + "\""
            imageView.image = guess?.image
            option = (guess?.ch)!
            break
        case "sp":
            explainText.text = "That is \"" + (guess?.sp[0])! + "\""
            imageView.image = guess?.image
            option = (guess?.sp)!
            break
        case "fr":
            explainText.text = "That is \"" + (guess?.fr[0])! + "\""
            imageView.image = guess?.image
            option = (guess?.fr)!
            break
        default:
            explainText.text = "That is \"" + (guess?.ch[0])! + "\""
            imageView.image = guess?.image
            option = (guess?.ch)!
            break
        }
        for phrase in (option) {
            print("possible phrase: " + phrase)
            if phrase.contains(detectedText) {
                looper = true
            }
        }
        print("detectedText: " + detectedText)
        if looper {
            looper = false
            if resultCount[index] == 0 {
                resultCount[index] = 1
            }
            answerText.text = "Correct!"
        } else {
            if resultCount[index] == 0 {
                resultCount[index] = 2
            }
            answerText.text = "Incorrect!"
            if randArray.count == 0 {
                randArray.insert(index, at: 0)
            } else {
                randArray.insert(index, at: Int(arc4random_uniform(UInt32(randArray.count-1) + 1)))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let lang = UserDefaults.standard.string(forKey: "language") {
            speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: lang))
        } else {
            speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "zh_Hans"))
        }
        
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 2
        textView.layer.cornerRadius = 10
        
        randArray = [0, 1, 2, 3, 4, 5, 6, 7]
        randArray.shuffle()
        
        setGuess()
        
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


