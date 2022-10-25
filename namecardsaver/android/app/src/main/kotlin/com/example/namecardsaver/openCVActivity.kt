package com.glion.namecardsaver

import android.content.Context
import android.content.pm.PackageManager
import android.hardware.Camera
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

private const val CHANNEL = "com.glion.namecardsaver/android"
class openCVActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            getPicture()
        }
    }
    private fun getPicture() : String{
        var imagePath = ""
        //TODO : 카메라 열고 사진 촬영
        if(checkCameraHardware(this))
        {
            getCameraInstance()
        }
        else
            imagePath = "이 기기에서는 카메라를 사용할 수 없습니다."
        return imagePath
    }
    // 카메라 하드웨어 감지
    private fun checkCameraHardware(context:Context):Boolean{
        return context.packageManager.hasSystemFeature(PackageManager.FEATURE_CAMERA_ANY)
    }
    // 카메라 기능 확인
    fun getCameraInstance() : Camera?{
        return try{
            Camera.open()
        }catch (e : Exception){
            null
        }
    }
}
