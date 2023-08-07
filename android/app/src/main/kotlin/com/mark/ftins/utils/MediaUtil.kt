package com.mark.ftins.utils

import android.content.Context
import android.provider.MediaStore

class MediaUtil {

    companion object{

        @JvmStatic
        fun getPictureMediaPath(context : Context) : List<String>{
            val res  = ArrayList<String>()
            val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI
            val arr : Array<String> = arrayOf(
                MediaStore.Images.Media._ID,
                MediaStore.Images.Media.DATA,
                MediaStore.Images.Media.SIZE,
                MediaStore.Images.Media.DISPLAY_NAME
            )
            context.contentResolver.query(uri, arr, null, null , null)?.apply {
                while (moveToNext()) {
                    var path = context.getString(getColumnIndex(MediaStore.Images.Media.DATA))
                    res.add(path)
                }
            }
            return  res
        }

        @JvmStatic
        fun getVideoMediaPath(context : Context) : List<String>{
            val res  = ArrayList<String>()
            val uri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI
            val arr : Array<String> = arrayOf(
                MediaStore.Video.Media._ID,
                MediaStore.Video.Media.DATA,
                MediaStore.Video.Media.SIZE,
                MediaStore.Video.Media.DISPLAY_NAME
            )
            context.contentResolver.query(uri, arr, null, null , null)?.apply {
                while (moveToNext()) {
                    var path = context.getString(getColumnIndex(MediaStore.Video.Media.DATA))
                    res.add(path)
                }
            }
            return  res
        }
    }
}