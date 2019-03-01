//
//  MatchGame.swift
//  Digipet
//
//  Created by Timothy Obiso on 3/28/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

import UIKit
import Speech

class MatchGame: UIViewController, SFSpeechRecognizerDelegate {
    
    var langArray = Int()
    let audioEngine = AVAudioEngine()
    var speechRecognizer = SFSpeechRecognizer()
    var request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isRecording = false
    
    var detectedText : String = ""

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
                    //print("hewwo!")
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
                    print("Error!")
                    print("User denied access")
                case .restricted:
                    self.talkButton.isEnabled = false
                    print("Error!")
                    print("Speech recognition restricted")
                case .notDetermined:
                    self.talkButton.isEnabled = false
                    print("Error!")
                    print("Speech recognition not yet authorized")
                }
            }
        }
    }
    
    
    
    @IBOutlet weak var talkButton: UIButton!
    
    let transKey : [[[String]]] = [
        [
            ["苹果"],["la pomme", "les pommes"],["la manzana", "las manzanas"]
        ],
        [
            ["面包"],["le pain", "les paines"],["el pan", "los panes"]
        ],
        [
            ["肉"],["la viande", "les viandes"],["la carne", "las carnes"]
        ],
        [
            ["鸡蛋"],["l'œuf", "les œufs"],["el juevo", "los perros"]
        ],
        [
            ["白饭"],["le riz", "les riz"],["el arroz", "los arroces"]
        ],
        [
            ["奶酪"],["le fromage", "les fromages"],["el queso", "los quesos"]
        ]
    ]
    
    var matchNum = -1
    var matchCard = -1
    
    
    var randomHalf = (1...8).map{_ in Int(arc4random_uniform(6))}
    var random: [Int] = []
    var flipped: Int = 0
    var flippedNum: Int = -1
    var matched: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var currentCard: Int = -1
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lang = UserDefaults.standard.string(forKey: "language") {
            speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: lang))
            switch lang {
            case "zh_Hans":
                langArray = 0
                break
            case "fr_FR":
                langArray = 1
                break
            case "es_ES":
                langArray = 2
                break
            default:
                langArray = 0
                
            }
        } else {
            speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "zh_Hans"))
            langArray = 0
        }
        
        //print(random)
        random = randomHalf + randomHalf
        random.shuffle()
        label.text = ""
        talkButton.isEnabled = false
        
    }
    override var shouldAutorotate: Bool {
        return true
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //print(flipped)
    }
    @IBAction func button1(_ sender: Any) {
        cardTouch(num: 0)
    }
    @IBAction func button2(_ sender: Any) {
        cardTouch(num: 1)
    }
    @IBAction func button3(_ sender: Any) {
        cardTouch(num: 2)
    }
    @IBAction func button4(_ sender: Any) {
        cardTouch(num: 3)
    }
    @IBAction func button5(_ sender: Any) {
        cardTouch(num: 4)
    }
    @IBAction func button6(_ sender: Any) {
        cardTouch(num: 5)
    }
    @IBAction func button7(_ sender: Any) {
        cardTouch(num: 6)
    }
    @IBAction func button8(_ sender: Any) {
        cardTouch(num: 7)
    }
    @IBAction func button9(_ sender: Any) {
        cardTouch(num: 8)
    }
    @IBAction func button10(_ sender: Any) {
        cardTouch(num: 9)
    }
    
    @IBAction func button11(_ sender: Any) {
        cardTouch(num: 10)
    }
    @IBAction func button12(_ sender: Any) {
        cardTouch(num: 11)
    }
    @IBAction func button13(_ sender: Any) {
        cardTouch(num: 12)
    }
    @IBAction func button14(_ sender: Any) {
        cardTouch(num: 13)
    }
    @IBAction func button15(_ sender: Any) {
        cardTouch(num: 14)
    }
    @IBAction func button16(_ sender: Any) {
        cardTouch(num: 15)
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func cardFlip(card: Int) -> UIImage {
        if card == 0 {
            return #imageLiteral(resourceName: "apple")
        } else if card == 1 {
            return #imageLiteral(resourceName: "bread")
        } else if card == 2 {
            return #imageLiteral(resourceName: "meat")
        } else if card == 3 {
            return #imageLiteral(resourceName: "egg")
        } else if card == 4 {
            return #imageLiteral(resourceName: "rice")
        } else {
            return #imageLiteral(resourceName: "cheese")
        }
        
            
    }
    func cardTouch(num: Int) {
        let buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9, button10, button11, button12, button13, button14, button15, button16]
        if flipped >= 2 {
            label.text = ""
            flipAll()
            flipped = 0
            currentCard = -1
        } else if flipped == 1 && random[num] == flippedNum {
            label.text = "What is it?"
            print("visual match")
            disableAll()
            talkButton.isEnabled = true
            matchNum = num
            matchCard = currentCard
//            matched[currentCard] =  true
//            print(flippedNum)
//            matched[num] = true
//            buttons[num]?.isEnabled = false
//            buttons[currentCard]?.isEnabled = false
        } else if flipped == 0 {
            currentCard = num
        } else if flipped == 1 {
            label.text = "Try again!"
        }
        flippedNum = random[num]
        currentCard = num
        (buttons[num] as UIButton!).setImage(cardFlip(card: random[num]), for: .normal)
        flipped+=1
    }
    
    @IBAction func talkButtonTouched(_ sender: Any) {
        if isRecording == true {
            request.endAudio()
            request = SFSpeechAudioBufferRecognitionRequest()
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            recognitionTask?.cancel()
            isRecording = false
           
            
            let check = transKey[random[matchNum]][langArray]
            var looper = false
            for phrase in check {
                if detectedText.contains(phrase){
                    looper = true
                }
            }
            if looper {
                looper = false
                matched[matchCard] = true
                print(flippedNum)
                matched[matchNum] = true
                print("audio match")
                label.text = "Match!"
            } else {
                label.text = "Try again!"
            }
            enableAll()
            talkButton.isEnabled = false
            
        } else {
            self.recordAndRecognizeSpeech()
            isRecording = true
        }
    }
    
    
    func flipAll() {
        if !matched[0] {
            button1.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[1] {
            button2.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[2] {
            button3.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[3] {
            button4.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[4] {
            button5.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[5] {
            button6.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[6] {
            button7.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[7] {
            button8.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[8] {
            button9.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[9] {
            button10.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[10] {
            button11.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[11] {
            button12.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[12] {
            button13.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[13] {
            button14.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[14] {
            button15.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
        if !matched[15] {
            button16.setImage(#imageLiteral(resourceName: "backofcard"), for: .normal)
        }
    }
    
    func disableAll(){
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        button5.isEnabled = false
        button6.isEnabled = false
        button7.isEnabled = false
        button8.isEnabled = false
        button9.isEnabled = false
        button10.isEnabled = false
        button11.isEnabled = false
        button12.isEnabled = false
        button13.isEnabled = false
        button14.isEnabled = false
        button15.isEnabled = false
        button16.isEnabled = false
    }
    
    func enableAll(){
        if !matched[0] {
            button1.isEnabled = true
        }
        if !matched[1] {
            button2.isEnabled = true
        }
        if !matched[2] {
            button3.isEnabled = true
        }
        if !matched[3] {
            button4.isEnabled = true
        }
        if !matched[4] {
            button5.isEnabled = true
        }
        if !matched[5] {
            button6.isEnabled = true
        }
        if !matched[6] {
            button7.isEnabled = true
        }
        if !matched[7] {
            button8.isEnabled = true
        }
        if !matched[8] {
            button9.isEnabled = true
        }
        if !matched[9] {
            button10.isEnabled = true
        }
        if !matched[10] {
            button11.isEnabled = true
        }
        if !matched[11] {
            button12.isEnabled = true
        }
        if !matched[12] {
            button13.isEnabled = true
        }
        if !matched[13] {
            button14.isEnabled = true
        }
        if !matched[14] {
            button15.isEnabled = true
        }
        if !matched[15] {
            button16.isEnabled = true
        }
    }
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension Array {
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<10
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}
