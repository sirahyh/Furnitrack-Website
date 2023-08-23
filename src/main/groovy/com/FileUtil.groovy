package com

import grails.util.Holders
import org.springframework.web.multipart.MultipartFile

class FileUtil {
    public static String getRootPath(){
        return Holders.servletContext?.getRealPath("")
    }


    public static File makeDirectory(String path){
        File file = new File(path)
        if (!file.exists()){
            file.mkdirs()
        }
        return file
    }

//    request.getFile("productFile")
    public static String uploadItemImage(Integer itemId, MultipartFile multipartFile){
        if (itemId && multipartFile){
            String itemImagePath = "${getRootPath()}item-image/"
            makeDirectory(itemImagePath)
            multipartFile.transferTo(new File(itemImagePath, itemId + "-" + multipartFile.originalFilename))
            return multipartFile.originalFilename
        }
        return ""
    }
}
