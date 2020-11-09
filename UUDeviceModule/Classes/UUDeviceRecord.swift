//
//  UUDeviceRecord.swift
//  TestCamera
//
//  Created by Asun on 2020/10/16.
//

import Foundation
import AVFoundation

@objcMembers open class UUDeviceRecord : NSObject{
    private var recorder:AVAudioRecorder? //录音器
    private var player:AVAudioPlayer? //播放器
    private var recorderSeetingsDic:[String : Any]? //录音器设置参数数组
    private var volumeTimer:Timer! //定时器线程，循环监测录音的音量大小
    private var aacPath:String? //录音存储路径
    public static let shared: UUDeviceRecord = UUDeviceRecord()
    public  var recorderVolumeClosure :((Double)->())?
    override init() {
        super.init()
        createRecorder()
    }
    
    @discardableResult
    public func createRecorder() -> UUDeviceRecord {
        //初始化录音器
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        
        //设置录音类型
        try! session.setCategory(AVAudioSession.Category.playAndRecord)
        //设置支持后台
        try! session.setActive(true)
        //获取Document目录
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                         .userDomainMask, true)[0]
        //组合录音文件路径
        aacPath = docDir + "/play.aac"
        //初始化字典并添加设置参数
        recorderSeetingsDic =
            [
                AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC),
                AVNumberOfChannelsKey: 2, //录音的声道数，立体声为双声道
                AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
                AVEncoderBitRateKey : 320000,
                AVSampleRateKey : 44100.0 //录音器每秒采集的录音样本数
            ]
        return self
    }
}

extension UUDeviceRecord {
    
    @discardableResult
    func startRecord() -> UUDeviceRecord {
        //初始化录音器
        recorder = try! AVAudioRecorder(url: URL(string: aacPath!)!,
                                        settings: recorderSeetingsDic!)
        if recorder != nil {
            //开启仪表计数功能
            recorder!.isMeteringEnabled = true
            //准备录音
            recorder!.prepareToRecord()
            //开始录音
            recorder!.record()
            //启动定时器，定时更新录音音量
            volumeTimer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                               selector: #selector(self.levelTimer),
                                               userInfo: nil, repeats: true)
        }
        return self
    }
    
    func stopRecord() {
        recorder?.stop()
        //录音器释放
        recorder = nil
        //暂停定时器
        if volumeTimer != nil {
            volumeTimer.invalidate()
            volumeTimer = nil
        }
    }
    
    //定时检测录音音量
    @objc func levelTimer() {
        if (recorder != nil) {
            recorder!.updateMeters() // 刷新音量数据
            //            let averageV:Float = recorder!.averagePower(forChannel: 0) //获取音量的平均值
            let maxV:Float = recorder!.peakPower(forChannel: 0) //获取音量最大值
            let lowPassResult:Double = pow(Double(10), Double(0.05*maxV))
            if recorderVolumeClosure != nil {
                recorderVolumeClosure!(lowPassResult)
            }
        }
    }
}
