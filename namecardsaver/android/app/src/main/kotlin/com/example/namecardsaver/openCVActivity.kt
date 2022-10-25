package com.glion.namecardsaver

import android.content.Context
import android.content.pm.PackageManager
import android.hardware.Camera
import android.os.Bundle
import io.flutter.Log
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

private const val CHANNEL = "com.glion.namecardsaver/android"
class openCVActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // result.success 부분 인자에  플러터로 반환시켜줄 값이 들어감
        // 플러터로부터 이미지 경로 받고, 그 이미지로부터 ocr 처리해서 필요정보 딴다음에 map에 저장해서 그 map을 넘기자.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            var s = temp()
            result.success(s)
        }
    }
    fun temp():String{
        return "success"
    }
}
