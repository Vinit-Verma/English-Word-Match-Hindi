//
//  SecondViewController.swift
//  Eng Word Match
//
//  Created by mac on 2016-10-21.
//  Copyright © 2016 Marianne Mathleins forlag. All rights reserved.
//

import UIKit
import iAd


struct Question {
    var Question : String!
    var Answers : [String]!
    var Answer : Int!
}





class SecondViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var g1: UIImageView!
    @IBOutlet weak var r1: UIImageView!
    @IBOutlet weak var g2: UIImageView!
    @IBOutlet weak var r2: UIImageView!
    @IBOutlet weak var g3: UIImageView!
    @IBOutlet weak var r3: UIImageView!
    @IBOutlet weak var g4: UIImageView!
    @IBOutlet weak var r4: UIImageView!
    @IBOutlet weak var g5: UIImageView!
    @IBOutlet weak var r5: UIImageView!
    
    @IBOutlet weak var scoreBackground: UIImageView!
    //@IBOutlet weak var score: UILabel!
    @IBOutlet weak var next: UIButton!
    @IBOutlet weak var quit: UIButton!

    
    @IBOutlet var resume: UIButton!
    @IBOutlet var roundNumber: UILabel!
    
    
    var timer : NSTimer!
    var counter = 60
    
    var Questions = [Question]()
    var QNumber = Int()
    var correct = Int()
    
    var i = 1 //for number of rounds
    var j = 0 //counting number of correct answers
    
    var rNum = 0
    
    var totalQuestions = 0.0
    var totalRightAnswers = 0.0
    var accuracy = 100.0
    
    var stringTotal = String()
    var stringAnswer = String()
    var stringAccuracy = String()
    
    let questionsDefault = NSUserDefaults.standardUserDefaults()
    let answersDefaults = NSUserDefaults.standardUserDefaults()
    let accuracyDefault = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Syntax  Question(Question: "", Answers: ["","",""], Answer: ),
        

        nextRound()
        hide()
        PickQuestion()
        
        //code for timer
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
        
        if(questionsDefault.stringForKey("questions") != nil){
            totalQuestions = questionsDefault.valueForKey("questions") as! Double
            stringTotal = questionsDefault.stringForKey("questions")!
        }
        if(answersDefaults.stringForKey("right") != nil){
            totalRightAnswers = answersDefaults.valueForKey("right") as! Double
            stringAnswer = answersDefaults.stringForKey("right")!
        }
        if(accuracyDefault.stringForKey("acc") == nil){
            accuracy = accuracyDefault.valueForKey("acc") as! Double
            stringAccuracy = accuracyDefault.stringForKey("acc")!
        }
        print("\(stringTotal) : \(stringAnswer) : \(stringAccuracy)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //Funtion for timer
    internal func updateTimer(){
        counter = counter - 1
        if(counter > 0){
            timerLabel.text = "Time left : " + String(counter)
        }else{
            if i < 6{
                PickQuestion()
                counter = 60
            }
        }
    }

    
    //Function to hhide all the indicatora initially
    func hide(){
        g1.hidden=true
        g2.hidden=true
        g3.hidden=true
        g4.hidden=true
        g5.hidden=true
        r1.hidden=true
        r2.hidden=true
        r3.hidden=true
        r4.hidden=true
        r5.hidden=true
        scoreBackground.hidden=true
        //score.hidden=true
        next.hidden=true
        quit.hidden=true
        resume.hidden=true
        //rNum++
        //roundNumber.text = "Round " + String(rNum)
    }
    
    
    
    //funtion for selecting question
    func PickQuestion(){
        
            if Questions.count > 0{
                QNumber = random() % Questions.count
                wordLabel.text = Questions[QNumber].Question
                correct = Questions[QNumber].Answer
            
            
                for i in 0..<buttons.count{
                    buttons[i].setTitle(Questions[QNumber].Answers[i], forState: UIControlState.Normal)
                }
            }
    }
    
    func showScore(){
        //score.text = "Your score : " + String(j)
        scoreBackground.hidden=false
        //score.hidden=false
        next.hidden=false
        quit.hidden=false
    }
    
    
    //action of pause button
    @IBAction func pause(sender: AnyObject) {
        
        timer.invalidate()
        timer = nil
        scoreBackground.hidden = false
        quit.hidden = false
        resume.hidden = false
        
    }
    
    //action of resume button
    @IBAction func resume(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
        scoreBackground.hidden = true
        quit.hidden = true
        resume.hidden = true
    }
    
    @IBAction func button1(sender: AnyObject) {
        counter = 60
        
        
        if i < 6{
            if correct == 0{
                j++
                totalRightAnswers++
                
                //print("RA")
                //print(totalRightAnswers)
                answersDefaults.setObject(totalRightAnswers, forKey: "right")
                PickQuestion()
                switch i {
                    case 1 : g1.hidden=false
                    case 2 : g2.hidden=false
                    case 3 : g3.hidden=false
                    case 4 : g4.hidden=false
                    case 5 : g5.hidden=false
                    default : hide()
                }
            }
            else{
                PickQuestion()
                switch i {
                    case 1 : r1.hidden=false
                    case 2 : r2.hidden=false
                    case 3 : r3.hidden=false
                    case 4 : r4.hidden=false
                    case 5 : r5.hidden=false
                    default : hide()
                }
            }
        }
        i++
        if i > 5{
            showScore()
            
        }
    }
    
    
    
    @IBAction func button2(sender: AnyObject) {
        counter = 60
        
        if i < 6{
            if correct == 1{
                j++
                totalRightAnswers++
                
                //print("RA")
                //print(totalRightAnswers)
                answersDefaults.setObject(totalRightAnswers, forKey: "right")
                PickQuestion()
                switch i {
                case 1 : g1.hidden=false
                case 2 : g2.hidden=false
                case 3 : g3.hidden=false
                case 4 : g4.hidden=false
                case 5 : g5.hidden=false
                default : hide()
                }
            }
            else{
                PickQuestion()
                switch i {
                case 1 : r1.hidden=false
                case 2 : r2.hidden=false
                case 3 : r3.hidden=false
                case 4 : r4.hidden=false
                case 5 : r5.hidden=false
                default : hide()
                }
            }
        }
        i++
        if i > 5{
            showScore()
            
        }
    }
    
    
    
    @IBAction func button3(sender: AnyObject) {
        counter = 60
        
        if i < 6{
            if correct == 2{
                j++
                totalRightAnswers++
                
                //print("RA")
                //print(totalRightAnswers)
                answersDefaults.setObject(totalRightAnswers, forKey: "right")
                PickQuestion()
                switch i {
                case 1 : g1.hidden=false
                case 2 : g2.hidden=false
                case 3 : g3.hidden=false
                case 4 : g4.hidden=false
                case 5 : g5.hidden=false
                default : hide()
                }
            }
            else{
                PickQuestion()
                switch i {
                case 1 : r1.hidden=false
                case 2 : r2.hidden=false
                case 3 : r3.hidden=false
                case 4 : r4.hidden=false
                case 5 : r5.hidden=false
                default : hide()
                }
            }
        }
        i++
        if i > 5{
            showScore()
            
        }
    }
    
    @IBAction func next(sender: AnyObject) {
        nextRound()
        i = 1
        totalQuestions = totalQuestions + 5
        
        questionsDefault.setObject(totalQuestions, forKey: "questions")
        
        //print("updated")
        //print(totalQuestions)
        //print(totalRightAnswers)
        acc()
    }
    
    func acc(){
        //print(totalQuestions)
        //print(totalRightAnswers)
        
        accuracy = (totalRightAnswers / totalQuestions) * 100
        accuracyDefault.setObject(accuracy, forKey: "acc")
        print (accuracy)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "V2-V1"){
            let destVC : ViewController = segue.destinationViewController as! ViewController
            destVC.accuracyFromSecondVC = stringAccuracy
            destVC.totalQuestionsFromSecondVC = stringTotal
            
        }
    }
    
    
    func nextRound() {
        
        
        rNum++
        roundNumber.text = "Round " + String(rNum)
        
        
        Questions = [
            //Nouns
            Question(Question: "nqÄZVuk", Answers: ["thunder","accident","rain"], Answer: 1),
            Question(Question: "n®igj", Answers: ["afternoon","nerve","reason"], Answer: 0),
            Question(Question: "vk;", Answers: ["piece","night","night"], Answer: 2),
            Question(Question: "gok", Answers: ["air","pen","relation"], Answer: 0),
            Question(Question: "tkuoj", Answers: ["promise","chance","animal"], Answer: 2),
            Question(Question: "¶ySV", Answers: ["cheese","apartment","energy"], Answer: 1),
            Question(Question: "Js=", Answers: ["area","evening","food"], Answer: 0),
            Question(Question: "n'kZd", Answers: ["failure","carpet","audience"], Answer: 2),
            Question(Question: "ir>M", Answers: ["autumn","hurry","intention"], Answer: 0),
            Question(Question: "cSx", Answers: ["bag","deal","disease"], Answer: 0),
            Question(Question: "xsan", Answers: ["ball","ear","health"], Answer: 0),
            Question(Question: "leqæ rV", Answers: ["hill","beach","figure"], Answer: 1),
            Question(Question: "fcLrj", Answers: ["bed","electricity","joke"], Answer: 0),
            Question(Question: "ch;j", Answers: ["beer","hat","island"], Answer: 0),
            Question(Question: "i{kh", Answers: ["fork","home","bird"], Answer: 2),
            Question(Question: "jDr", Answers: ["blood","example","fruit"], Answer: 0),
            Question(Question: "uko", Answers: ["boat","book","coat"], Answer: 0),
            Question(Question: "'ko", Answers: ["desert","body","coast"], Answer: 1),
            Question(Question: "fdrkc", Answers: ["adventure","book","comment"], Answer: 1),
            Question(Question: "yM+dk", Answers: ["angel","boy","fridge"], Answer: 1),
            Question(Question: "j®Vh", Answers: ["bread","friend","history"], Answer: 0),
            Question(Question: "nqYgu", Answers: ["aunt","bride","game"], Answer: 1),
            Question(Question: "iqy", Answers: ["actor","bridge","coward"], Answer: 1),
            Question(Question: "ÒkbZ", Answers: ["adult","brother","class"], Answer: 1),
            Question(Question: "cl", Answers: ["answer","bus","fish"], Answer: 1),
            Question(Question: "O;kikj", Answers: ["business","horror","music"], Answer: 2),
            Question(Question: "eD[ku", Answers: ["butter","loan","motor"], Answer: 0),
            Question(Question: "jkt|kuh", Answers: ["capital","match","sport"], Answer: 0),
            Question(Question: "xkM+h", Answers: ["car","name","point"], Answer: 0),
            Question(Question: "dkMZ", Answers: ["card","cross","period"], Answer: 0),
            Question(Question: "ekeyk", Answers: ["case","data","dust"], Answer: 0),
            Question(Question: "fcYyh", Answers: ["beer","cat","drink"], Answer: 1),
            Question(Question: "lnh", Answers: ["advice","boat","century"], Answer: 2),
            Question(Question: "dqjlh", Answers: ["army","chair","result"], Answer: 1),
            Question(Question: "iuhj", Answers: ["cheese","river","smile"], Answer: 0),
            Question(Question: "cPpk", Answers: ["child","soldier","test"], Answer: 0),
            Question(Question: "pquko", Answers: ["choice","story","walk"], Answer: 0),
            Question(Question: "pØ", Answers: ["circle","race","suitcase"], Answer: 0),
            Question(Question: "'kgj", Answers: ["city","sea","thing"], Answer: 0),
            Question(Question: "d{kk", Answers: ["class","snow","tank"], Answer: 0),
            Question(Question: "|M+h", Answers: ["rhythm","shirt","clock"], Answer: 2),
            Question(Question: "rV", Answers: ["coat","optimist","page"], Answer: 0),
            Question(Question: "jax", Answers: ["companion","legend","mail"], Answer: 0),
            Question(Question: "daiuh", Answers: ["company","judge","life"], Answer: 0),
            Question(Question: "daI;wVj", Answers: ["computer","general","gym"], Answer: 0),
            Question(Question: "laca|", Answers: ["company","connection","desk"], Answer: 1),
            Question(Question: "laidZ", Answers: ["age","brother","contact"], Answer: 2),
            Question(Question: "Áfrfyfi", Answers: ["bull","button","copy"], Answer: 2),
            Question(Question: "ns'k", Answers: ["concert","country","destiny"], Answer: 1),
            Question(Question: "d®l", Answers: ["course","debt","discipline"], Answer: 0),
            Question(Question: "ppsjk Òkb", Answers: ["cousin","fool","help"], Answer: 0),
            Question(Question: "xk;", Answers: ["cow","lesson","loss"], Answer: 0),
            Question(Question: "vijk|", Answers: ["crime","monkey","note"], Answer: 0),
            Question(Question: "ÒhM", Answers: ["part","note","crowd"], Answer: 2),
            Question(Question: "rkt", Answers: ["pirate","crown","roof"], Answer: 1),
            Question(Question: "xzkgd", Answers: ["payment","pressure","customer"], Answer: 2),
            Question(Question: "csVh", Answers: ["animal","blouse","daughter"], Answer: 2),
            Question(Question: "fnu", Answers: ["couple","day","embrace"], Answer: 1),
            Question(Question: "e©r", Answers: ["assistant","death","film"], Answer: 1),
            Question(Question: "varj", Answers: ["difference","gift","hour"], Answer: 0),
            Question(Question: "dfBukbZ", Answers: ["bottle","difficulty","injury"], Answer: 1),
            Question(Question: "j¨x", Answers: ["album","cap","disease"], Answer: 2),
            Question(Question: "nwjh", Answers: ["ash","bullet","distance"], Answer: 2),
            Question(Question: "fpfdRld", Answers: ["autumn","brain","doctor"], Answer: 2),
            Question(Question: "n~okj", Answers: ["bird","career","door"], Answer: 2),
            Question(Question: "liuk", Answers: ["dream","gold","junk"], Answer: 0),
            Question(Question: "Mªkboj", Answers: ["driver","liquid","mood"], Answer: 0),
            Question(Question: "drZO;", Answers: ["duty","morning","office"], Answer: 0),
            Question(Question: "dku", Answers: ["ear","news","order"], Answer: 0),
            Question(Question: "vFkZO;oLFkk", Answers: ["economy","occasion","perspective"], Answer: 0),
            Question(Question: "d¨guh", Answers: ["elbow","prayer","row"], Answer: 0),
            Question(Question: "izos'k", Answers: ["thief","sack","entrance"], Answer: 2),
            Question(Question: "'kke", Answers: ["temple","evening","stranger"], Answer: 1),
            Question(Question: "psgjk", Answers: ["face","servant","stocking"], Answer: 0),
            Question(Question: "rF;", Answers: ["fact","post","ruby"], Answer: 0),
            Question(Question: "fdlku", Answers: ["princess","farmer","owner"], Answer: 1),
            Question(Question: "i{k", Answers: ["favour","medal","library"], Answer: 0),
            Question(Question: "vkx", Answers: ["fire","link","mall"], Answer: 0),
            Question(Question: "Qwy", Answers: ["flower","interest","lottery"], Answer: 0),
            Question(Question: "[kkuk", Answers: ["food","furniture","journal"], Answer: 0),
            Question(Question: "ou", Answers: ["computer","forest","generation"], Answer: 1),
            Question(Question: "ÒkX;", Answers: ["balance","constitution","fortune"], Answer: 2),
            Question(Question: "fe=", Answers: ["beard","cause","friend"], Answer: 2),
            Question(Question: "Qy", Answers: ["attitude","blood","fruit"], Answer: 2),
            Question(Question: "yM+dh", Answers: ["angel","fantasy","girl"], Answer: 2),
            Question(Question: "l¨uk", Answers: ["eye","gold","honour"], Answer: 1),
            Question(Question: "lewg", Answers: ["group","horse","mirror"], Answer: 0),
            Question(Question: "fny", Answers: ["equality","focus","heart"], Answer: 2),
            Question(Question: "enn", Answers: ["group","help","quarter"], Answer: 1),
            Question(Question: "bfrgkl", Answers: ["history","sailor","silver"], Answer: 0),
            Question(Question: "|¨M+k", Answers: ["horse","shower","state"], Answer: 0),
            Question(Question: "le;", Answers: ["back","face","hour"], Answer: 2),
            Question(Question: "bjknk", Answers: ["base","favour","intention"], Answer: 2),
            Question(Question: "n~ohi", Answers: ["birthday","foot","island"], Answer: 2),
            Question(Question: ";k=k", Answers: ["business","goat","journey"], Answer: 2),
            Question(Question: "dqath", Answers: ["coat","grave","key"], Answer: 2),
            Question(Question: "pqacu", Answers: ["comb","guitar","kiss"], Answer: 2),
            Question(Question: "pkdw", Answers: ["dialect","holiday","knife"], Answer: 2),
            Question(Question: "dkuwu", Answers: ["fame","kidney","law"], Answer: 2),
            Question(Question: "iSj", Answers: ["fight","leg","table"], Answer: 1),
            Question(Question: "i=", Answers: ["letter","field","danger"], Answer: 0),
            Question(Question: "ftanxh", Answers: ["confidence","examination","life"], Answer: 2),
            Question(Question: "lkfgR;", Answers: ["crown","divorce","literature"], Answer: 2),
            Question(Question: "cgqr dqN", Answers: ["lot","program","edge"], Answer: 0),
            Question(Question: "esy", Answers: ["cousin","mail","entrance"], Answer: 1),
            Question(Question: "vkneh", Answers: ["area","darling","man"], Answer: 2),
            Question(Question: "uD'kk", Answers: ["map","attitude","choice"], Answer: 0),
            Question(Question: "'kknh", Answers: ["comfort","marriage","door"], Answer: 1),
            Question(Question: "Ò¨tu", Answers: ["bag","celebration","meal"], Answer: 2),
            Question(Question: "vFkZ", Answers: ["beach","confirmation","meaning"], Answer: 2),
            Question(Question: "lnL;", Answers: ["member","crew","origine"], Answer: 0),
            Question(Question: "Le`fr", Answers: ["pain","memory","secret"], Answer: 1),
            Question(Question: "|u", Answers: ["money","rhyme","shade"], Answer: 0),
            Question(Question: "lqcg", Answers: ["reply","sky","morning"], Answer: 2),
            Question(Question: "igkM", Answers: ["mountain","snake","talent"], Answer: 0),
            Question(Question: "izd`fr", Answers: ["sound","nature","team"], Answer: 1),
            Question(Question: "iM+¨lh", Answers: ["neighbour","thought","weather"], Answer: 0),
            Question(Question: "'k¨j", Answers: ["breakfast","noise","wife"], Answer: 1),
            Question(Question: "ulZ", Answers: ["camp","definition","nurse"], Answer: 2),
            Question(Question: "dk;kZy;", Answers: ["carrot","drop","office"], Answer: 2),
            Question(Question: "volj", Answers: ["opportunity","coin","people"], Answer: 0),
            Question(Question: "nnZ", Answers: ["grass","house","pain"], Answer: 2),
            Question(Question: "dkxt", Answers: ["guest","knife","paper"], Answer: 2),
            Question(Question: "ikdZ", Answers: ["junction","locker","park"], Answer: 2),
            Question(Question: "'kkafr", Answers: ["peace","love","moment"], Answer: 0),
            Question(Question: "ys[kuh", Answers: ["nearness","pen","memory"], Answer: 1),
            Question(Question: "y¨x", Answers: ["palm","people","look"], Answer: 1),
            Question(Question: "fp=", Answers: ["refrigerator","school","picture"], Answer: 2),
            Question(Question: "VqdM+k", Answers: ["piece","scarf","teenager"], Answer: 0),
            Question(Question: "tsc", Answers: ["pocket","thumb","value"], Answer: 0),
            Question(Question: "t+gj", Answers: ["poison","tongue","vehicle"], Answer: 0),
            Question(Question: "'kfDr", Answers: ["power","ring","situation"], Answer: 0),
            Question(Question: "tsy", Answers: ["market","prison","question"], Answer: 1),
            Question(Question: "leL;k", Answers: ["accident","problem","reality"], Answer: 1),
            Question(Question: "loky", Answers: ["afternoon","question","reform"], Answer: 1),
            Question(Question: "ckfj'k", Answers: ["apartment","rain","report"], Answer: 1),
            Question(Question: "dkj.k", Answers: ["beginning","reason","sauce"], Answer: 1),
            Question(Question: "fj'rsnkj", Answers: ["bell","science","relative"], Answer: 2),
            Question(Question: "fdjk;k", Answers: ["rent","bomb","series"], Answer: 0),
            Question(Question: "ifj.kke", Answers: ["branch","result","sheep"], Answer: 1),
            Question(Question: "pkoy", Answers: ["rice","shoulder","bridge"], Answer: 0),
            Question(Question: "vaxwBh", Answers: ["butter","ring","spelling"], Answer: 1),
            Question(Question: "unh", Answers: ["building","river","spring"], Answer: 1),
            Question(Question: "lM+d", Answers: ["staff","bus","road"], Answer: 2),
            Question(Question: "Ldwy", Answers: ["burial","ink","school"], Answer: 2),
            Question(Question: "foKku", Answers: ["science","interview","bride"], Answer: 0),
            Question(Question: "nwljk", Answers: ["care","iron","second"], Answer: 2),
            Question(Question: "i¨r", Answers: ["joy","ship","case"], Answer: 1),
            Question(Question: "deht", Answers: ["charm","kitchen","shirt"], Answer: 2),
            Question(Question: "'kkoj", Answers: ["shower","lady","clock"], Answer: 0),
            Question(Question: "i{k", Answers: ["crisis","law","side"], Answer: 2),
            Question(Question: "cgu", Answers: ["cure","leg","sister"], Answer: 2),
            Question(Question: "fLFkfr", Answers: ["daughter","limit","situation"], Answer: 2),
            Question(Question: "vkdk'k", Answers: ["sky","literature","diary"], Answer: 0),
            Question(Question: "lSfud", Answers: ["map","soldier","discovery"], Answer: 1),
            Question(Question: "xhr", Answers: ["education","song","marriage"], Answer: 1),
            Question(Question: "olar", Answers: ["spring","member","equipment"], Answer: 0),
            Question(Question: "tklwl", Answers: ["facility","movie","spy"], Answer: 2),
            Question(Question: "jkT;", Answers: ["fact","mushroom","state"], Answer: 2),
            Question(Question: "isV", Answers: ["farmer","niece","stomach"], Answer: 2),
            Question(Question: "dgkuh", Answers: ["finger","number","story"], Answer: 2),
            Question(Question: "lM+d", Answers: ["fun","nightmare","street"], Answer: 2),
            Question(Question: "phuh", Answers: ["future","opinion","sugar"], Answer: 2),
            Question(Question: "xeh", Answers: ["summer","nurse","garbage"], Answer: 0),
            Question(Question: "lwjt", Answers: ["garden","sun","painter"], Answer: 1),
            Question(Question: "est", Answers: ["glass","religion","table"], Answer: 2),
            Question(Question: "pk;", Answers: ["road","tea","grandmother"], Answer: 1),
            Question(Question: "v?;kid", Answers: ["hair","security","teacher"], Answer: 2),
            Question(Question: "vkrad", Answers: ["head","separation","terror"], Answer: 2),
            Question(Question: "p¨j", Answers: ["thief","sister","headquarters"], Answer: 0),
            Question(Question: "le;", Answers: ["time","skirt","humour"], Answer: 0),
            Question(Question: "'kgj", Answers: ["jaw","spoon","town"], Answer: 2),
            Question(Question: "ijaijk", Answers: ["sugar","tradition","jealousy"], Answer: 1),
            Question(Question: "isM", Answers: ["tree","support","language"], Answer: 0),
            Question(Question: "lp", Answers: ["leader","surrounding","truth"], Answer: 2),
            Question(Question: "ewY;", Answers: ["baby","value","liberation"], Answer: 1),
            Question(Question: "jk;", Answers: ["battle","liquor","view"], Answer: 2),
            Question(Question: "vkokt", Answers: ["vkokt","loser","voice"], Answer: 2),
            Question(Question: ";q)", Answers: ["capital","war","luxury"], Answer: 1),
            Question(Question: "ikuh", Answers: ["card","meat","water"], Answer: 2),
            Question(Question: "jkLrk", Answers: ["way","mess","chair"], Answer: 0),
            Question(Question: "e©le", Answers: ["child","weather","mountain"], Answer: 1),
            Question(Question: "'kknh", Answers: ["wedding","neighbour","chapter"], Answer: 0),
            Question(Question: "lIrkg", Answers: ["cat","party","week"], Answer: 2),
            Question(Question: "iRuh", Answers: ["wife","pattern","cloud"], Answer: 0),
            Question(Question: "efgyk", Answers: ["congratulations","peach","woman"], Answer: 2),
            Question(Question: "ydM", Answers: ["contact","wood","picture"], Answer: 1),
            Question(Question: "'kCn", Answers: ["word","prisoner","prisoner"], Answer: 0),
            Question(Question: "nqfu;k", Answers: ["destination","program","world"], Answer: 2),
            Question(Question: "lky", Answers: ["diamond","year","rat"], Answer: 1),
            
            // Adjectives
            
            Question(Question: "xqLlk", Answers: ["empty","angry","illegal"], Answer: 1),
            Question(Question: "cqjk", Answers: ["heavy","natural","bad"], Answer: 2),
            Question(Question: "lqanj", Answers: ["beautiful","boring","poor"], Answer: 0),
            Question(Question: "cMk", Answers: ["clean","big","furious"], Answer: 1),
            Question(Question: "vaÄk", Answers: ["content","dry","blind"], Answer: 2),
            Question(Question: "uhyk", Answers: ["blue","drunk","loud"], Answer: 0),
            Question(Question: "mckÅ", Answers: ["big","boring","private"], Answer: 1),
            Question(Question: "cºknqj", Answers: ["ugly","brave","voluntary"], Answer: 1),
            Question(Question: "p®Mk", Answers: ["broad","filthy","sad"], Answer: 0),
            Question(Question: "Òwjk", Answers: ["brown","lazy","perfect"], Answer: 0),
            Question(Question: "Øwj", Answers: ["grateful","red","busy"], Answer: 2),
            Question(Question: "'kkar", Answers: ["equal","dangerous","calm"], Answer: 2),
            Question(Question: "lLrk", Answers: ["blue","cheap","horrible"], Answer: 1),
            Question(Question: "galeq£", Answers: ["bankrupt","cheerful","furious"], Answer: 1),
            Question(Question: "lkQ", Answers: ["angry","clean","envious"], Answer: 1),
            Question(Question: "g¨f'k;kj", Answers: ["clever","married","strange"], Answer: 0),
            Question(Question: "vukMh", Answers: ["traditional","clumsy","wonderful"], Answer: 1),
            Question(Question: "BaM", Answers: ["cold","shy","united"], Answer: 0),
            Question(Question: "vkjkenk;d", Answers: ["comfortable","mad","simple"], Answer: 0),
            Question(Question: "lkekU;", Answers: ["bankrupt","common","difficult"], Answer: 1),
            Question(Question: "iwjk", Answers: ["complete","fresh","large"], Answer: 0),
            Question(Question: "tfVy", Answers: ["complicated","peaceful","scared"], Answer: 0),
            Question(Question: "lkexzh", Answers: ["content","false","open"], Answer: 0),
            Question(Question: "BaMk", Answers: ["global","cool","magic"], Answer: 1),
            Question(Question: "lgh", Answers: ["banal","correct","elegant"], Answer: 1),
            Question(Question: "ikxy", Answers: ["broad","crazy","generous"], Answer: 1),
            Question(Question: "funZ;h", Answers: ["cruel","human","national"], Answer: 0),
            Question(Question: "£+rjukd", Answers: ["dangerous","romantic","thirsty"], Answer: 0),
            Question(Question: "vaÄsjk", Answers: ["worried","surprised","dark"], Answer: 2),
            Question(Question: "xgjk", Answers: ["deep","sleepy","urgent"], Answer: 0),
            Question(Question: "fofÒUu", Answers: ["different","smooth","specific"], Answer: 0),
            Question(Question: "dfBu", Answers: ["wide","difficult","upset"], Answer: 1),
            Question(Question: "nwj", Answers: ["tall","satisfied","distant"], Answer: 2),
            Question(Question: "'kjkch", Answers: ["drunk","pleasant","warm"], Answer: 0),
            Question(Question: "lw£k", Answers: ["blind","dry","huge"], Answer: 1),
            Question(Question: "dqafBr", Answers: ["complete","dull","important"], Answer: 1),
            Question(Question: "vklku", Answers: ["brown","easy","pure"], Answer: 1),
            Question(Question: "ijs'kku", Answers: ["depressed","stupid","welcome"], Answer: 0),
            Question(Question: "£kyh", Answers: ["correct","empty","tidy"], Answer: 1),
            Question(Question: "fo'kky", Answers: ["easy","enormous","flat"], Answer: 1),
            Question(Question: "tyrs", Answers: ["envious","happy","pregnant"], Answer: 0),
            Question(Question: "cjkcj", Answers: ["equal","proud","slow"], Answer: 0),
            Question(Question: "Bhd", Answers: ["exact","separate","weird"], Answer: 0),
            Question(Question: "mRrstd", Answers: ["exciting","modern","quiet"], Answer: 0),
            Question(Question: "egaxk", Answers: ["expensive","long","nervous"], Answer: 0),
            Question(Question: "esyk", Answers: ["fair","interesting","new"], Answer: 0),
            Question(Question: ">wBk", Answers: ["cool","liar","international"], Answer: 1),
            Question(Question: "izfl}", Answers: ["beautiful","famous","hard"], Answer: 1),
            Question(Question: "miokl", Answers: ["fast","generous","kind"], Answer: 0),
            Question(Question: "e¨Vk", Answers: ["exciting","fat","normal"], Answer: 1),
            Question(Question: "xank", Answers: ["delicious","filthy","frightened"], Answer: 1),
            Question(Question: "tqek±uk", Answers: ["fine","guilty","jealous"], Answer: 0),
            Question(Question: "lery", Answers: ["flat","healthy","personal"], Answer: 0),
            Question(Question: "rkt+k", Answers: ["calm","fresh","practical"], Answer: 1),
            Question(Question: "Ò;Òhr", Answers: ["frightened","social","wrong"], Answer: 0),
            Question(Question: "etsnkj", Answers: ["funny","true","young"], Answer: 0),
            Question(Question: "etsnkj", Answers: ["funny","true","young"], Answer: 0),
            Question(Question: "vfr Ñz}", Answers: ["furious","narrow","regular"], Answer: 0),
            Question(Question: "mnkj", Answers: ["generous","hungry","pink"], Answer: 0),
            Question(Question: "oSf'od", Answers: ["cruel","global","honest"], Answer: 1),
            Question(Question: "vPNk", Answers: ["clumsy","good","lucky"], Answer: 1),
            Question(Question: "vkÒkjh", Answers: ["grateful","intelligent","popular"], Answer: 0),
            Question(Question: "egku", Answers: ["comfortable","great","hopeless"], Answer: 1),
            Question(Question: "£q'k", Answers: ["bad","expensive","happy"], Answer: 2),
            Question(Question: "dfBu", Answers: ["clear","hard","poisonous"], Answer: 1),
            Question(Question: "LoLFk", Answers: ["healthy","kind","possible"], Answer: 0),
            Question(Question: "Òkjh", Answers: ["busy","dull","heavy"], Answer: 2),
            Question(Question: "mPpk", Answers: ["clever","high","physical"], Answer: 1),
            Question(Question: "bZekunkj", Answers: ["honest","pretty","round"], Answer: 0),
            Question(Question: "fujk'kktud", Answers: ["hopeless","safe","successful"], Answer: 0),
            Question(Question: "Ò;adj", Answers: ["horrible","universal","wise"], Answer: 0),
            Question(Question: "fo'kky", Answers: ["huge","unhappy","wet"], Answer: 0),
            Question(Question: "ekuo", Answers: ["human","secret","terrible"], Answer: 0),
            Question(Question: "Òw£k", Answers: ["hungry","ridiculous","small"], Answer: 0),
            Question(Question: "leku", Answers: ["suspicious","sorry","identical"], Answer: 2),
            Question(Question: "voSÄ", Answers: ["present","old","illegal"], Answer: 2),
            Question(Question: "t#jh", Answers: ["important","nice","rotten"], Answer: 0),
            Question(Question: "eklwe", Answers: ["innocent","rural","sick"], Answer: 0),
            Question(Question: "cqf}eku", Answers: ["scared","ready","intelligent"], Answer: 2),
            Question(Question: "fnypLi", Answers: ["interesting","right","relaxed"], Answer: 0),
            Question(Question: "rjg", Answers: ["kind","similar","tired"], Answer: 0),
            Question(Question: "cM+k", Answers: ["innocent","large","responsible"], Answer: 1),
            Question(Question: "nsj l", Answers: ["bare","late","wild"], Answer: 1),
            Question(Question: "vkylh", Answers: ["lazy","violent","thin"], Answer: 0),
            Question(Question: "dkuwuh", Answers: ["legal","professional","tight"], Answer: 0),
            Question(Question: "yack", Answers: ["late","long","original"], Answer: 1),
            Question(Question: "t®j l", Answers: ["brave","fair","loud"], Answer: 2),
            Question(Question: "de", Answers: ["brutal","funny","low"], Answer: 2),
            Question(Question: "ÒkX;'kkyh", Answers: ["cold","dark","lucky"], Answer: 2),
            Question(Question: "ikxy", Answers: ["embarrassed","high","mad"], Answer: 2),
            Question(Question: "tknw", Answers: ["common","deep","magic"], Answer: 2),
            Question(Question: "fookfgr", Answers: ["different","distant","married"], Answer: 2),
            Question(Question: "eryc", Answers: ["famous","mean","tasty"], Answer: 1),
            Question(Question: "vkÄqfud", Answers: ["modern","secure","thrilling"], Answer: 0),
            Question(Question: "uaxk", Answers: ["healthy","married","naked"], Answer: 2),
            Question(Question: "ladh.kZ", Answers: ["narrow","silly","unusual"], Answer: 0),
            Question(Question: "izkd`frd", Answers: ["natural","sensitive","stingy"], Answer: 0),
            Question(Question: "ijs'kku", Answers: ["legal","nervous","real"], Answer: 1),
            Question(Question: "u;k", Answers: ["crazy","fat","new"], Answer: 2),
            Question(Question: "vPNk", Answers: ["low","mean","nice"], Answer: 2),
            Question(Question: "lkÄkj.k", Answers: ["cheap","normal","quick"], Answer: 1),
            Question(Question: "iqjkuk", Answers: ["fine","old","serious"], Answer: 1),
            Question(Question: "£qyk", Answers: ["open","terrified","uncomfortable"], Answer: 0),
            Question(Question: "vlyh", Answers: ["original","tragic","weak"], Answer: 0),
            Question(Question: "'kkafriw.kZ", Answers: ["peaceful","tough","well"], Answer: 0),
            Question(Question: "mRre", Answers: ["perfect","typical","yellow"], Answer: 0),
            Question(Question: "O;fDrxr", Answers: ["boring","expensive","personal"], Answer: 2),
            Question(Question: "Ò©frd", Answers: ["frightened","loud","physical"], Answer: 2),
            Question(Question: "xqykch", Answers: ["mad","pink","poisonous"], Answer: 1),
            Question(Question: "lq£n", Answers: ["high","narrow","pleasant"], Answer: 2),
            Question(Question: "xfjc", Answers: ["distant","famous","poor"], Answer: 2),
            Question(Question: "y¨dfiz;", Answers: ["beautiful","cheap","popular"], Answer: 2),
            Question(Question: "laÒo", Answers: ["clever","identical","possible"], Answer: 2),
            Question(Question: "O;ogkfjd", Answers: ["original","practical","wet"], Answer: 1),
            Question(Question: "xÒZorh", Answers: ["pregnant","quick","wrong"], Answer: 0),
            Question(Question: "oZreku", Answers: ["nice","present","romantic"], Answer: 1),
            Question(Question: "lqanj", Answers: ["broad","pretty","safe"], Answer: 1),
            Question(Question: "O;fDrxr", Answers: ["brutal","hopeless","private"], Answer: 2),
            Question(Question: "is'ksoj", Answers: ["busy","important","professional"], Answer: 2),
            Question(Question: "vfÒeku", Answers: ["bare","complete","proud"], Answer: 2),
            Question(Question: "'kq)", Answers: ["legal","pure","ready"], Answer: 1),
            Question(Question: "cSaxuh", Answers: ["purple","rich","thirsty"], Answer: 0),
            Question(Question: "'khÄz", Answers: ["quick","relaxed","tired"], Answer: 0),
            Question(Question: "'kkar", Answers: ["different","quiet","satisfied"], Answer: 1),
            Question(Question: "rS;kj", Answers: ["envious","honest","ready"], Answer: 2),
            Question(Question: "okLrfod", Answers: ["happy","national","real"], Answer: 2),
            Question(Question: "yky", Answers: ["guilty","lucky","red"], Answer: 2),
            Question(Question: "fu;fer", Answers: ["good","modern","regular"], Answer: 2),
            Question(Question: "vkjke", Answers: ["funny","long","relaxed"], Answer: 2),
            Question(Question: "ÄkfeZd", Answers: ["cool","filthy","religious"], Answer: 2),
            Question(Question: "mRrjnk;h", Answers: ["crazy","responsible","delicious"], Answer: 1),
            Question(Question: "|uh", Answers: ["rich","dangerous","angry"], Answer: 0),
            Question(Question: "gkL;kLin", Answers: ["calm","elegant","ridiculous"], Answer: 2),
            Question(Question: "lgh", Answers: ["empty","right","grateful"], Answer: 1),
            Question(Question: "j¨ekuh", Answers: ["brave","enormous","romantic"], Answer: 2),
            Question(Question: "lM+k gqvk", Answers: ["comfortable","intelligent","rotten"], Answer: 2),
            Question(Question: "vlH;", Answers: ["rough","jealous","great"], Answer: 0),
            Question(Question: "x¨y", Answers: ["round","illegal","possible"], Answer: 0),
            Question(Question: "xzkfe.k", Answers: ["pretty","rural","low"], Answer: 1),
            Question(Question: "mnkl", Answers: ["perfect","drunk","sad"], Answer: 2),
            Question(Question: "lqjf{kr", Answers: ["clean","exact","safe"], Answer: 2),
            Question(Question: "Mjk gqvk", Answers: ["blue","equal","scared"], Answer: 2),
            Question(Question: "xqIr", Answers: ["secret","global","embarrassed"], Answer: 0),
            Question(Question: "lqjf{kr", Answers: ["heavy","pleasant","secure"], Answer: 2),
            Question(Question: "LokFkh", Answers: ["natural","selfish","specific"], Answer: 1),
            Question(Question: "laosnu'khy", Answers: ["international","rough","sensitive"], Answer: 2),
            Question(Question: "vyx", Answers: ["regular","separate","magic"], Answer: 1),
            Question(Question: "xaÒhj", Answers: ["serious","naked","practical"], Answer: 0),
            Question(Question: "N¨Vk", Answers: ["upset","short","similar"], Answer: 1),
            Question(Question: "'kehZyk", Answers: ["shy","unusual","wild"], Answer: 0),
            Question(Question: "chekj", Answers: ["popular","selfish","sick"], Answer: 2),
            Question(Question: "ew£", Answers: ["human","normal","silly"], Answer: 2),
            Question(Question: "leku", Answers: ["similar","mean","fresh"], Answer: 0),
            Question(Question: "ljy", Answers: ["correct","simple","deep"], Answer: 1),
            Question(Question: "lqLr", Answers: ["sleepy","clear","late"], Answer: 0),
            Question(Question: "|hj", Answers: ["hungry","innocent","slow"], Answer: 2),
            Question(Question: "|¨Vk", Answers: ["lazy","interesting","small"], Answer: 2),
            Question(Question: "fpduk", Answers: ["nervous","smooth","physical"], Answer: 1),
            Question(Question: "lkekftd", Answers: ["open","religious","social"], Answer: 2),
            Question(Question: "eqyk;e", Answers: ["sleepy","soft","urgent"], Answer: 1),
            Question(Question: "£sn", Answers: ["fine","pink","sorry"], Answer: 2),
            Question(Question: "datwl", Answers: ["stingy","real","sensitive"], Answer: 0),
            Question(Question: "vthc", Answers: ["secret","strange","tight"], Answer: 1),
            Question(Question: "csodwQ", Answers: ["stupid","universal","wise"], Answer: 0),
            Question(Question: "lQy", Answers: ["private","successful","terrible"], Answer: 1),
            Question(Question: "gSjku", Answers: ["complicated","huge","surprised"], Answer: 2),
            Question(Question: "lansgtud", Answers: ["banal","fat","suspicious"], Answer: 2),
            Question(Question: "yack", Answers: ["cold","horrible","tall"], Answer: 2),
            Question(Question: "Ò;kud", Answers: ["terrible","pregnant","silly"], Answer: 0),
            Question(Question: "bj", Answers: ["sorry","terrified","united"], Answer: 1),
            Question(Question: "iryk", Answers: ["exciting","thin","unhappy"], Answer: 1),
            Question(Question: "I;klk", Answers: ["cheerful","round","thirsty"], Answer: 2),
            Question(Question: "ekapd", Answers: ["right","sick","thrilling"], Answer: 2),
            Question(Question: "lkQ", Answers: ["simple","smooth","tidy"], Answer: 2),
            Question(Question: "rax", Answers: ["ridiculous","tight","uncomfortable"], Answer: 1),
            Question(Question: "N¨Vk", Answers: ["false","rural","tiny"], Answer: 2),
            Question(Question: "Fkdk gqvk", Answers: ["fair","new","tired"], Answer: 2),
            Question(Question: "dM+k", Answers: ["personal","successful","tough"], Answer: 2),
            Question(Question: "ijaijkxr", Answers: ["slow","stupid","traditional"], Answer: 2),
            Question(Question: "nq£n", Answers: ["tragic","violent","yellow"], Answer: 0),
            Question(Question: "lp", Answers: ["surprised","true","weak"], Answer: 1),
            Question(Question: "BsB", Answers: ["red","strange","typical"], Answer: 2),
            Question(Question: "dq:i", Answers: ["suspicious","traditional","ugly"], Answer: 2),
            Question(Question: "vlqfoÄktud", Answers: ["tough","uncomfortable","whole"], Answer: 1),
            Question(Question: "vizlUu", Answers: ["thrilling","unhappy","wrong"], Answer: 1),
            Question(Question: ",drk", Answers: ["secure","terrified","united"], Answer: 2),
            Question(Question: "lkoZÒ©fed", Answers: ["old","present","universal"], Answer: 2),
            Question(Question: "vlkeku;", Answers: ["sad","stingy","unusual"], Answer: 2),
            Question(Question: "ijs'kku", Answers: ["small","typical","upset"], Answer: 2),
            Question(Question: "vrh vko';d", Answers: ["urgent","tasty","short"], Answer: 0),
            Question(Question: "lkeku;", Answers: ["separate","usual","rotten"], Answer: 1),
            Question(Question: "fgalkRed", Answers: ["quiet","shy","violent"], Answer: 2),
            Question(Question: "LoSfPNd", Answers: ["social","tragic","voluntary"], Answer: 2),
            Question(Question: "xje", Answers: ["warm","fast","common"], Answer: 0),
            Question(Question: "det+¨j", Answers: ["purple","weak","content"], Answer: 1),
            Question(Question: "vthc", Answers: ["pure","weird","tall"], Answer: 1),
            Question(Question: "Lokxr", Answers: ["soft","ugly","welcome"], Answer: 2),
            Question(Question: "dqvk", Answers: ["true","well","voluntary"], Answer: 1),
            Question(Question: "xhyk", Answers: ["tidy","wet","young"], Answer: 1),
            Question(Question: "iwjs", Answers: ["tiny","usual","whole"], Answer: 2),
            Question(Question: "p©M+k", Answers: ["welcome","wide","wonderful"], Answer: 1),
            Question(Question: "taxyh", Answers: ["easy","proud","wild"], Answer: 2),
            Question(Question: "leÖknkj", Answers: ["dry","flat","wise"], Answer: 2),
            Question(Question: "vk'p;Ztud", Answers: ["thin","well","wonderful"], Answer: 2),
            Question(Question: "fpafrr", Answers: ["big","dark","worried"], Answer: 2),
            Question(Question: "xyr", Answers: ["difficult","dull","wrong"], Answer: 2),
            Question(Question: "ihyk", Answers: ["yellow","warm","wide"], Answer: 0),
            Question(Question: ";qok", Answers: ["brown","worried","young"], Answer: 2),
            
            // Verbs
            
            Question(Question: "lger", Answers: ["admit","agree","enjoy"], Answer: 1),
            Question(Question: "vuqefr", Answers: ["act","allow","educate"], Answer: 1),
            Question(Question: "mRrj", Answers: ["answer","escape","fail"], Answer: 0),
            Question(Question: "O;oLFkk", Answers: ["arrange","expect","fade"], Answer: 0),
            Question(Question: "igqap", Answers: ["arrive","examine","feel"], Answer: 0),
            Question(Question: "iwNuk", Answers: ["ask","drive","excuse"], Answer: 0),
            Question(Question: "cuuk", Answers: ["become","fear","glow"], Answer: 0),
            Question(Question: "'kq:", Answers: ["get","finish","begin"], Answer: 2),
            Question(Question: "ekuuk", Answers: ["believe","express","freeze"], Answer: 0),
            Question(Question: "lacaf|r", Answers: ["belong","frighten","gossip"], Answer: 0),
            Question(Question: "jkLrk", Answers: ["way","mess","chair"], Answer: 0),
            Question(Question: "e©le", Answers: ["child","weather","mountain"], Answer: 1),
            Question(Question: "'kknh", Answers: ["wedding","neighbour","chapter"], Answer: 0),
            Question(Question: "lIrkg", Answers: ["cat","party","week"], Answer: 2),
            Question(Question: "iRuh", Answers: ["wife","pattern","cloud"], Answer: 0),
            Question(Question: "efgyk", Answers: ["congratulations","peach","woman"], Answer: 2),
            Question(Question: "ydM+h", Answers: ["contact","wood","picture"], Answer: 1),
            Question(Question: "'kCn", Answers: ["word","prisoner","amazing"], Answer: 0),
            Question(Question: "nqfu;k", Answers: ["destination","program","world"], Answer: 2),
            Question(Question: "lky", Answers: ["diamond","year","rat"], Answer: 1),
            Question(Question: "idM", Answers: ["ask","catch","jump"], Answer: 1),
            Question(Question: "eukuk", Answers: ["arrange","celebrate","keep"], Answer: 1),
            Question(Question: "ifjorZu", Answers: ["assure","change","knit"], Answer: 1),
            Question(Question: "pqUuk", Answers: ["avoid","choose","lack"], Answer: 1),
            Question(Question: "lkQ", Answers: ["admire","clean","last"], Answer: 1),
            Question(Question: "can", Answers: ["answer","close","knock"], Answer: 1),
            Question(Question: "vkuk", Answers: ["advice","come","kick"], Answer: 1),
            Question(Question: "rqyuk", Answers: ["bore","compare","joke"], Answer: 1),
            Question(Question: "dsafnzr /;ku", Answers: ["bury","concentrate","learn"], Answer: 1),
            Question(Question: "tkjh j[kuk", Answers: ["continue","decide","leave"], Answer: 0),
            Question(Question: "le>kuk", Answers: ["convince","describe","lead"], Answer: 0),
            Question(Question: "idkuk", Answers: ["cook","develop","lessen"], Answer: 0),
            Question(Question: "fxurh", Answers: ["count","discover","mean"], Answer: 0),
            Question(Question: "vkoj.k", Answers: ["cover","doubt","murder"], Answer: 0),
            Question(Question: "cukuk", Answers: ["create","earn","notice"], Answer: 0),
            Question(Question: "ikj", Answers: ["end","organise","cross"], Answer: 2),
            Question(Question: "j¨uk", Answers: ["cry","fix","pass"], Answer: 0),
            Question(Question: "deh", Answers: ["cut","fight","please"], Answer: 0),
            Question(Question: "r;", Answers: ["decide","fly","point"], Answer: 0),
            Question(Question: "o.kZu", Answers: ["describe","forget","plan"], Answer: 0),
            Question(Question: "fodkl", Answers: ["develop","develop","perform"], Answer: 0),
            Question(Question: "ejuk", Answers: ["die","govern","polish"], Answer: 0),
            Question(Question: "[k¨t", Answers: ["discover","guess","rain"], Answer: 0),
            Question(Question: "liuk", Answers: ["dream","give","remember"], Answer: 0),
            Question(Question: "pykuk", Answers: ["drive","happen","relax"], Answer: 0),
            Question(Question: "dekuk", Answers: ["accuse","earn","scare"], Answer: 1),
            Question(Question: "[kkuk", Answers: ["accompany","eat","sell"], Answer: 1),
            Question(Question: "f'kf{kr", Answers: ["assist","educate","send"], Answer: 1),
            Question(Question: "iz¨Rlkfgr djuk", Answers: ["arrive","encourage","set"], Answer: 1),
            Question(Question: "vkuan", Answers: ["borrow","enjoy","share"], Answer: 1),
            Question(Question: "tkap", Answers: ["boil","examine","shop"], Answer: 1),
            Question(Question: "cgkuk", Answers: ["breathe","excuse","sing"], Answer: 1),
            Question(Question: "le>kuk", Answers: ["buy","explain","sit"], Answer: 1),
            Question(Question: "vlQy", Answers: ["build","fail","sleep"], Answer: 1),
            Question(Question: "egwll", Answers: ["care","feel","smile"], Answer: 1),
            Question(Question: "yM+kb", Answers: ["choose","fight","snow"], Answer: 1),
            Question(Question: "Òjuk", Answers: ["clean","fill","sob"], Answer: 1),
            Question(Question: "[®t", Answers: ["celebrate","find","sound"], Answer: 1),
            Question(Question: "var", Answers: ["carry","finish","speak"], Answer: 1),
            Question(Question: "Bhd djuk", Answers: ["close","fix","specify"], Answer: 1),
            Question(Question: "mM+uk", Answers: ["collect","fly","spend"], Answer: 1),
            Question(Question: "j¨duk", Answers: ["come","forbid","spread"], Answer: 1),
            Question(Question: "Òwyuk", Answers: ["compare","forget","squeeze"], Answer: 1),
            Question(Question: "ekQ djuk", Answers: ["concentrate","forgive","stand"], Answer: 1),
            Question(Question: "tekuk", Answers: ["complain","freeze","steal"], Answer: 1),
            Question(Question: "Mjuk", Answers: ["cook","frighten","take"], Answer: 1),
            Question(Question: "feyuk", Answers: ["get","handle","talk"], Answer: 0),
            Question(Question: "nsuk", Answers: ["give","hate","taste"], Answer: 0),
            Question(Question: "tkuk", Answers: ["go","hear","teach"], Answer: 0),
            Question(Question: "c<+uk", Answers: ["grow","help","tell"], Answer: 0),
            Question(Question: "j{kk", Answers: ["guard","hire","terrify"], Answer: 0),
            Question(Question: "vuqeku", Answers: ["guess","hit","think"], Answer: 0),
            Question(Question: "yVduk", Answers: ["hang","impress","throw"], Answer: 0),
            Question(Question: "g¨uk", Answers: ["happen","install","tie"], Answer: 0),
            Question(Question: "uQjr", Answers: ["grow","hate","instruct"], Answer: 1),
            Question(Question: "gS", Answers: ["have","interview","touch"], Answer: 0),
            Question(Question: "lqUuk", Answers: ["hear","invite","tolerate"], Answer: 0),
            Question(Question: "enn", Answers: ["help","irritate","travel"], Answer: 0),
            Question(Question: "fNikuk", Answers: ["hide","jeopardize","treat"], Answer: 0),
            Question(Question: "fdjk;k", Answers: ["hire","jump","trust"], Answer: 0),
            Question(Question: "ekjuk", Answers: ["hit","kneel","tremble"], Answer: 0),
            Question(Question: "idM", Answers: ["hold","know","try"], Answer: 0),
            Question(Question: "vk'kk", Answers: ["hope","leap","turn"], Answer: 0),
            Question(Question: "vkfyaxu", Answers: ["hug","lend","type"], Answer: 0),
            Question(Question: "f'kdkj", Answers: ["hunt","let","unite"], Answer: 0),
            Question(Question: "tYnh", Answers: ["hurry","like","upset"], Answer: 0),
            Question(Question: "p¨V", Answers: ["hurt","lie","use"], Answer: 0),
            Question(Question: "lq|kj", Answers: ["advance","improve","vibrate"], Answer: 1),
            Question(Question: "c<+uk", Answers: ["affect","increase","visit"], Answer: 1),
            Question(Question: "bjknk", Answers: ["agree","intend","view"], Answer: 1),
            Question(Question: "vkea=.k", Answers: ["appear","invite","wait"], Answer: 1),
            Question(Question: "'kkfey", Answers: ["appreciate","join","walk"], Answer: 1),
            Question(Question: "et+kd", Answers: ["attempt","joke","want"], Answer: 1),
            Question(Question: "Nykax", Answers: ["beat","jump","watch"], Answer: 1),
            Question(Question: "j[kuk", Answers: ["bear","keep","wash"], Answer: 1),
            Question(Question: "ykr", Answers: ["begin","kick","waste"], Answer: 1),
            Question(Question: "pqacu", Answers: ["belong","kiss","wear"], Answer: 1),
            Question(Question: "tkuuk", Answers: ["bite","know","whisper"], Answer: 1),
            Question(Question: "galh", Answers: ["believe","laugh","win"], Answer: 1),
            Question(Question: "j[kuk", Answers: ["become","lay","wish"], Answer: 1),
            Question(Question: "usr`Ro", Answers: ["climb","lead","weep"], Answer: 1),
            Question(Question: "lh[kuk", Answers: ["commit","learn","work"], Answer: 1),
            Question(Question: "NqÍh", Answers: ["combine","leave","worry"], Answer: 1),
            Question(Question: "nsuk", Answers: ["compete","lend","write"], Answer: 1),
            Question(Question: "'kq:", Answers: ["get","finish","begin"], Answer: 2),
            Question(Question: ">wB", Answers: ["contact","lie","zoom"], Answer: 1),
            Question(Question: "fyQV", Answers: ["eat","connect","lift"], Answer: 2),
            Question(Question: "izdk'k", Answers: ["cough","entertain","light"], Answer: 2),
            Question(Question: "tSlk", Answers: ["count","establish","like"], Answer: 2),
            Question(Question: "lquuk", Answers: ["cover","feed","listen"], Answer: 2),
            Question(Question: "yack", Answers: ["continue","fill","long"], Answer: 2),
            Question(Question: "ns[kuk", Answers: ["complete","find","look"], Answer: 2),
            Question(Question: "[k¨uk", Answers: ["create","flatter","lose"], Answer: 2),
            Question(Question: "I;kj", Answers: ["cry","float","love"], Answer: 2),
            Question(Question: "cukuk", Answers: ["cross","focus","make"], Answer: 2),
            Question(Question: "'kknh", Answers: ["cure","fool","marry"], Answer: 2),
            Question(Question: "ekeyk", Answers: ["crush","have","matter"], Answer: 2),
            Question(Question: "eryc", Answers: ["decide","hold","mean"], Answer: 2),
            Question(Question: "feyuk", Answers: ["curse","hug","meet"], Answer: 2),
            Question(Question: "mYys[k", Answers: ["deliver","hurt","mention"], Answer: 2),
            Question(Question: "eu", Answers: ["destroy","intend","mind"], Answer: 2),
            Question(Question: "feJ.k", Answers: ["deserve","introduce","mix"], Answer: 2),
            Question(Question: "pky", Answers: ["die","lift","move"], Answer: 2),
            Question(Question: "gR;k", Answers: ["divide","make","murder"], Answer: 2),
            Question(Question: "t+:jr", Answers: ["divorce","loathe","need"], Answer: 2),
            Question(Question: "?;ku e", Answers: ["drag","notice","park"], Answer: 1),
            Question(Question: "ulZ", Answers: ["dive","nurse","pay"], Answer: 1),
            Question(Question: "vkKk dk ikyu", Answers: ["dream","obey","play"], Answer: 1),
            Question(Question: "[kqyk", Answers: ["drown","open","persuade"], Answer: 1),
            Question(Question: "O;oLFkk", Answers: ["dry","order","practice"], Answer: 1),
            Question(Question: "vk;¨tu", Answers: ["embrace","organize","pray"], Answer: 1),
            Question(Question: "dtZnkj", Answers: ["engage","owe","prefer"], Answer: 1),
            Question(Question: "viuk", Answers: ["enter","own","prepare"], Answer: 1),
            Question(Question: "jax", Answers: ["empty","paint","pretend"], Answer: 1),
            Question(Question: "ikZd", Answers: ["empty","paint","pretend"], Answer: 1),
            Question(Question: "ikZd", Answers: ["exclaim","park","promise"], Answer: 1),
            Question(Question: "ikl", Answers: ["explain","pass","protect"], Answer: 1),
            Question(Question: "osru", Answers: ["extend","pay","pull"], Answer: 1),
            Question(Question: "pquuk", Answers: ["fall","pick","realize"], Answer: 1),
            Question(Question: ";¨tuk", Answers: ["recognize","forbid","plan"], Answer: 2),
            Question(Question: "i©|k", Answers: ["listen","plant","raise"], Answer: 1),
            Question(Question: "£sy", Answers: ["load","play","quit"], Answer: 1),
            Question(Question: "fcanq", Answers: ["look","point","relate"], Answer: 1),
            Question(Question: "vH;kl", Answers: ["lose","practice","remind"], Answer: 1),
            Question(Question: "izkFkZuk", Answers: ["manage","pray","remove"], Answer: 1),
            Question(Question: "ilan", Answers: ["love","prefer","rent"], Answer: 1),
            Question(Question: "rS;kj", Answers: ["marry","prepare","reply"], Answer: 1),
            Question(Question: "nckuk", Answers: ["meet","press","repeat"], Answer: 1),
            Question(Question: "ukVd", Answers: ["murder","pretend","rescue"], Answer: 1),
            Question(Question: "j¨duk", Answers: ["obey","prevent","resemble"], Answer: 1),
            Question(Question: "oknk", Answers: ["mention","promise","resist"], Answer: 1),
            Question(Question: "j{kk", Answers: ["mind","protect","report"], Answer: 1),
            Question(Question: "lkfcr", Answers: ["mix","prove","return"], Answer: 1),
            Question(Question: "[khapuk", Answers: ["need","pull","reward"], Answer: 1),
            Question(Question: "lt+k", Answers: ["punish","reach","stare"], Answer: 0),
            Question(Question: "Mky", Answers: ["put","quote","stay"], Answer: 0),
            Question(Question: "N¨M+uk", Answers: ["quit","reflect","stop"], Answer: 0),
            Question(Question: "ckfj'k", Answers: ["rain","save","test"], Answer: 0),
            Question(Question: "mBkuk", Answers: ["raise","say","thrill"], Answer: 0),
            Question(Question: "igqap", Answers: ["reach","scream","value"], Answer: 0),
            Question(Question: ",glkl", Answers: ["realize","secure","volunteer"], Answer: 0),
            Question(Question: "igpkuuk", Answers: ["convince","recognize","see"], Answer: 1),
            Question(Question: "nZt", Answers: ["correct","register","seek"], Answer: 1),
            Question(Question: "vkjke", Answers: ["relax","separate","tackle"], Answer: 0),
            Question(Question: ";kn j[kuk", Answers: ["remember","sew","threaten"], Answer: 0),
            Question(Question: ";kn fnykuk", Answers: ["remind","settle","tidy"], Answer: 0),
            Question(Question: "gVkuk", Answers: ["remove","shake","tour"], Answer: 0),
            Question(Question: "fdjk;k", Answers: ["rent","shape","trip"], Answer: 0),
            Question(Question: "n¨gjkuk", Answers: ["repeat","shine","undergo"], Answer: 0),
            Question(Question: "mRrj", Answers: ["reply","shoot","urge"], Answer: 0),
            Question(Question: "fji¨V", Answers: ["move","report","show"], Answer: 1),
            Question(Question: "izfrfuf|Ro", Answers: ["linger","represent","sign"], Answer: 1),
            Question(Question: "foj¨|", Answers: ["address","call","resist"], Answer: 2),
            Question(Question: "okilh", Answers: ["admit","circle","return"], Answer: 2),
            Question(Question: "lokjh", Answers: ["announce","cling","ride"], Answer: 2),
            Question(Question: "vaxwBh", Answers: ["apply","combat","ring"], Answer: 2),
            Question(Question: "j¨y", Answers: ["approve","employ","roll"], Answer: 2),
            Question(Question: "lM+ka|", Answers: ["assemble","ease","rot"], Answer: 2),
            Question(Question: "n¨M", Answers: ["bend","economize","run"], Answer: 2),
            Question(Question: "ÒhM", Answers: ["bend","elaborate","rush"], Answer: 2),
            Question(Question: "cpkuk", Answers: ["bloom","enroll","save"], Answer: 2),
            Question(Question: "dguk", Answers: ["blow","lodge","say"], Answer: 2),
            Question(Question: "Mjuk", Answers: ["blush","lower","scare"], Answer: 2),
            Question(Question: "fpYykuk", Answers: ["boast","long","scream"], Answer: 2),
            Question(Question: "ns[kuk", Answers: ["bounce","loiter","see"], Answer: 2),
            Question(Question: "ryk'k", Answers: ["brush","manoeuvre","seek"], Answer: 2),
            Question(Question: "izrhr", Answers: ["burst","matter","seem"], Answer: 2),
            Question(Question: "cspuk", Answers: ["brag","measure","sell"], Answer: 2),
            Question(Question: "Òstuk", Answers: ["catch","melt","send"], Answer: 2),
            Question(Question: "eaFku", Answers: ["challenge","object","shake"], Answer: 2),
            Question(Question: "'ks;j", Answers: ["change","nurse","share"], Answer: 2),
            Question(Question: "ped", Answers: ["chase","offer","shine"], Answer: 2),
            Question(Question: "x¨yh ekjuk", Answers: ["chat","open","shoot"], Answer: 2),
            Question(Question: "fpYykuk", Answers: ["cheat","oppress","shout"], Answer: 2),
            Question(Question: "izn'kZu", Answers: ["chew","owe","show"], Answer: 2),
            Question(Question: ">¨adk", Answers: ["collapse","order","sigh"], Answer: 2),
            Question(Question: "ladsr", Answers: ["comb","own","sign"], Answer: 2),
            Question(Question: "xkuk", Answers: ["clarify","pant","sing"], Answer: 2),
            Question(Question: "cSBuk", Answers: ["comment","pat","sit"], Answer: 2),
            Question(Question: "uhan", Answers: ["coach","peal","sleep"], Answer: 2),
            Question(Question: "xa|", Answers: ["comfort","plant","smell"], Answer: 2),
            Question(Question: "eqLdku", Answers: ["compensate","post","smile"], Answer: 2),
            Question(Question: "c¨yuk", Answers: ["choke","poison","speak"], Answer: 2),
            Question(Question: "fcrkuk", Answers: ["confess","plot","spend"], Answer: 2),
            Question(Question: "[kM+k", Answers: ["conduct","preach","stand"], Answer: 2),
            Question(Question: "rkduk", Answers: ["confide","present","stare"], Answer: 2),
            Question(Question: "vkjaÒ", Answers: ["conquer","press","start"], Answer: 2),
            Question(Question: "jguk", Answers: ["cut","preside","stay"], Answer: 2),
            Question(Question: "pqjkuk", Answers: ["crawl","prevent","steal"], Answer: 2),
            Question(Question: "dne", Answers: ["deal","prioritise","step"], Answer: 2),
            Question(Question: ":d", Answers: ["declare","prove","stop"], Answer: 2),
            Question(Question: "v?;;u", Answers: ["damn","punish","study"], Answer: 2),
            Question(Question: "lQy", Answers: ["demand","puzzle","succeed"], Answer: 2),
            Question(Question: "lq>ko", Answers: ["define","qualify","suggest"], Answer: 2),
            Question(Question: "thfor", Answers: ["dial","question","survive"], Answer: 2),
            Question(Question: "fuxyuk", Answers: ["dig","rage","swallow"], Answer: 2),
            Question(Question: "ilhuk", Answers: ["differ","rape","sweat"], Answer: 2),
            Question(Question: "rSjuk", Answers: ["dominate","reform","swim"], Answer: 2),
            Question(Question: "ysuk", Answers: ["disbelieve","refresh","take"], Answer: 2),
            Question(Question: "ckrphr", Answers: ["disregard","register","talk"], Answer: 2),
            Question(Question: "Lokn", Answers: ["donate","regard","taste"], Answer: 2),
            Question(Question: "fl[kkuk", Answers: ["dress","release","teach"], Answer: 2),
            Question(Question: "dguk", Answers: ["drop","remain","tell"], Answer: 2),
            Question(Question: "l¨p", Answers: ["dust","reign","think"], Answer: 2),
            Question(Question: "Li'kZ", Answers: ["encourage","renew","touch"], Answer: 2),
            Question(Question: ";k=k", Answers: ["equip","repent","travel"], Answer: 2),
            Question(Question: "bykt", Answers: ["evacuate","renounce","treat"], Answer: 2),
            Question(Question: "Òj¨lk", Answers: ["exceed","represent","trust"], Answer: 2),
            Question(Question: "d¨f'k'k", Answers: ["face","reserve","try"], Answer: 2),
            Question(Question: "e¨M", Answers: ["faint","turn","repay"], Answer: 1),
            Question(Question: "mi;¨x", Answers: ["favour","use","reside"], Answer: 1),
            Question(Question: ";k=k", Answers: ["experience","visit","rest"], Answer: 1),
            Question(Question: "izrh{kk", Answers: ["finalize","reveal","wait"], Answer: 2),
            Question(Question: "tkxuk", Answers: ["fit","rhyme","wake"], Answer: 2),
            Question(Question: "pyuk", Answers: ["flood","ring","walk"], Answer: 2),
            Question(Question: "pkgrs", Answers: ["flourish","rot","want"], Answer: 2),
            Question(Question: "|qykbZ", Answers: ["wash","form","save"], Answer: 0),
            Question(Question: "|M+h", Answers: ["frustrate","watch","ruin"], Answer: 1),
            Question(Question: "ygj", Answers: ["furnish","rule","wave"], Answer: 2),
            Question(Question: "iguuk", Answers: ["fuss","run","wear"], Answer: 2),
            Question(Question: "QqlQqlkuk", Answers: ["generate","rush","whisper"], Answer: 2),
            Question(Question: "thruk", Answers: ["giggle","rust","win"], Answer: 2),
            Question(Question: "pkg", Answers: ["grant","sail","wish"], Answer: 2),
            Question(Question: "vk'p;", Answers: ["grade","satisfy","wonder"], Answer: 2),
            Question(Question: "dke", Answers: ["guard","scan","work"], Answer: 2),
            Question(Question: "fpark", Answers: ["harm","seem","worry"], Answer: 2),
            Question(Question: "fy[kuk", Answers: ["hope","sigh","write"], Answer: 2)
            
        ]
        
        
        
        
        
        
        hide()
        PickQuestion()
        
        //code for timer
        //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
        
    }
    
    
}


