//
//  AppDelegate.swift
//  CirclePay_Pod_iOS
//
//  Created by adelmohey on 04/06/2022.
//  Copyright (c) 2022 adelmohey. All rights reserved.
//

import UIKit
import CirclePay_Pod_iOS
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        CirclePay.merchantToken = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ODMyLCJpc1ZlcmlmaWVkIjpmYWxzZSwidG9rZW4iOiIiLCJmb3JnZXRQYXNzd29yZHRva2VuIjoiIiwiZ29vZ2xlT2F1dGhJRCI6IiIsImZhY2Vib29rT2F0aElkIjoiIiwiYXV0aHlfaWQiOiIiLCJzdGF0dXMiOiIwIiwiYWRkcmVzcyI6IiIsImJ1c2luZXNzTmFtZSI6IiIsImZpcnN0TmFtZSI6IkFsYWEiLCJsYXN0TmFtZSI6Ik1haGVlciIsImVtYWlsIjoiYWxhYW1haGVyQGNpcmNsZXBheS5haSIsIm1vYmlsZSI6IiswMTExMTk0NzUzOSIsImJ1c2luZXNzQWRkcmVzcyI6IkFsYWEgYnVzIGFkZHJlc3MiLCJ1c2VybmFtZSI6bnVsbCwidXBkYXRlZEF0IjoiMjAyMi0wMy0yOFQxMzoxOToyNS4zNjFaIiwiY3JlYXRlZEF0IjoiMjAyMi0wMy0yOFQxMzoxOToyNS4zNjFaIiwiYXBwX25hbWUiOiJjaXJjbGVwYXktc2RrIiwiaWF0IjoxNjQ4NDczNTY1fQ.OO9Y-MLECUbuCIq6ePc8WbhFfOd5A1yQs-nViStA8a4"
        
        CirclePay.accountToken = "Bearer eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2Iiwia2lkIjpudWxsLCJjdHkiOiJKV1QifQ..F-DlnpatONAl2U_rzGXC7w.sdYiTK3YUTK6gFyDVT22zgkzTVa21SiLmM7zktmzyaJVgtlvH-G2f1X5dDUmrUdZZ46wlfoCfg_OqhGrMoOSXiSWnPNeE4Xz_8-WAeKgQi09r4qCIwY7vLMnnl8HrvWmN4VX7Jy1SHq28zt5SsCDaPm3gxs0L6rKo1i5QOY7tEFQNAuxIXmH-gUBTwMnRFOXKczZ8qp5dvDRDQyF1r9py677a58eqKr1U50bByg_suVl5BolgWzICO8LK7AsuTjmCHqpeEiHtTT_i9nklgH_5ybVeglbQlUnYKHE8obQFwXpikwSWBtuXl7O2qgEypv-PVtrgocc_Ps8tz7WZTK-PRYXgkwOHkp8dS7YZJSUHzBI8y15dO0_2mEsLsk5_Q_5.vOT2TmD2DLNESTcWhMElcA"
        
        CirclePay.accountKey = "d895e3ec-0e05-31c4-b87e-78b7aa4a4c85"
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

