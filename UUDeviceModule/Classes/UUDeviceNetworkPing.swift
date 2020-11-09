//
//  UUDevicePing.swift
//  TestCamera
//
//  Created by Asun on 2020/10/16.
//

import Foundation


public protocol UUNetWorkPingDelegate: class {
    func didReceive(response: PingResponse)
}

class UUDeviceNetworkPing {
    
    var ping: SwiftyPing?
    
    public weak var delegate: UUNetWorkPingDelegate?
    
    private init() { }
    
    /// 监听网络Ping
    /// - Parameters:
    ///   - host: 监听地址
    ///   - pingConfig: 配置监听定时时间 超时间隔
    ///   - delegate: 回调网速
    required init(host: String = "www.baidu.com", pingConfig: PingConfiguration = .init(interval: 2, with: 3), delegate: UUNetWorkPingDelegate) {
        ping = try? SwiftyPing.init(host: host, configuration: pingConfig, queue: .global())
        self.delegate = delegate
        self.observableToNetWork()
        self.startListenNetworkPing()
    }
    
    /// 开启Ping监测
    public func startListenNetworkPing() {
        do {
            try ping?.startPinging()
        } catch {
            print("网络监测开启失败")
        }
    }
    
    public func observableToNetWork(){
        ping?.observer = { resp in
            self.delegate?.didReceive(response: resp)
        }
    }
    /// 关闭Ping监测并置为空
    public func stopListenNetworkPing() {
        ping?.stopPinging()
        ping = nil
        delegate = nil
    }
    
    /// 关闭Ping监测并置为空
    public func pauseListenNetworkPing() {
        ping?.stopPinging()
    }
}
