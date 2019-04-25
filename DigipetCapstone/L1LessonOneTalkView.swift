//
//  L1LessonOneTalkView.swift
//  Digipet
//
//  Created by Nicholas Kassoy on 5/2/18.
//  Copyright © 2018 Katie Katz. All rights reserved.
//

// every talkView was essentially copied and pasted, but the IBOutlets and actions will have to be connected to their respective screens
// "buttonPressed" function might have to be modified

import Speech
import UIKit
import SpriteKit
import GameplayKit

class L1LessonOneTalkView : UIViewController, SFSpeechRecognizerDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var talkButton: UIButton!
    @IBOutlet weak var myView: SKView!
    
    let audioEngine = AVAudioEngine()
    var speechRecognizer = SFSpeechRecognizer()
    var request = SFSpeechAudioBufferRecognitionRequest()
    var recognitionTask: SFSpeechRecognitionTask?
    var isRecording = false
    
    @IBAction func backButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
                    //self.detectedText = best
                    self.textField.text = best
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let lang = UserDefaults.standard.string(forKey: "language") {
            speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: lang))
        } else {
            speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "zh_Hans"))
        }
        textField.isUserInteractionEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //self.searchBar.endEditing(true)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        // if it was recording, stop recording and save input
        if isRecording == true {
            request.endAudio()
            request = SFSpeechAudioBufferRecognitionRequest()
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            recognitionTask?.cancel()
            isRecording = false
            talkButton.setImage(UIImage(named: "talk"), for: UIControlState.normal)
            let correct: Bool = (myView.scene as! L1LessonOne).checkAnswer(answer: textField.text!)
            let done: Bool! = (myView.scene as! L1LessonOne).isDone()
            
            if (correct) {
                textField.text = ""
            }
            
            // if correct answer and have answered all prompts
            if (correct && done) {
                self.transitioningDelegate = RZTransitionsManager.shared()
                let nextViewController = storyboard?.instantiateViewController(withIdentifier: "mazeGame")
                nextViewController?.transitioningDelegate = RZTransitionsManager.shared()
                self.present(nextViewController!, animated: true) {}
            }
        } else {
            self.recordAndRecognizeSpeech()
            isRecording = true
            talkButton.setImage(UIImage(named: "talkPressed"), for: UIControlState.normal)
        }
    }
    
    func revealButton() {
        talkButton.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    override var shouldAutorotate: Bool {
        return true
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
}

