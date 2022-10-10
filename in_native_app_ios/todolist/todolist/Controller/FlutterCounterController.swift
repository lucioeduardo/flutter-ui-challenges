//
//  FlutterCounterController.swift
//  todolist
//
//  Created by eduardo on 10/10/22.
//

import UIKit
import Flutter

class FlutterCounterController: FlutterViewController {
    
    var channel: FlutterMethodChannel?
    var todo: Todo?
    
    init(engine: FlutterEngine, todo: Todo){
        super.init(engine: engine, nibName: nil, bundle: nil)
        self.todo = todo
        
        channel = FlutterMethodChannel(name: "test_channel", binaryMessenger: self.binaryMessenger)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        channel?.invokeMethod("setTodo", arguments: ["description": todo?.descr, "deadline": todo?.deadline])

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
