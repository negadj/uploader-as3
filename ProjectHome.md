# 上传组件 #
纯as3写的上传中间件,通过js的回调等控制文件的上传与进度,要下载直接去[Source](Source.md)里下载


# 参数与设置 #

```
/**
  @param string logo 上传的按钮图片,必选!
  @param string url 上传文件的接口地址 ,服务端接收文件时的接口地址,必选!
  @param string field 上传文件的参数名,默认是file
  @param int maxsize 最大的上传文件大小,单位是M,默认10M
*/
```

# 接口与回调方法 #

```
<html>
<script>

//当选择文件时,取消时回调方法
function onCancel(e){
        console.log(e);
}
//上传完成时回调
function onComplete(e){
        console.log(e);
}
//上传过程中,进度变化回调
function onProgress(e){
        console.log(e);
}
//上传出错时回调
function onError(e){
        console.log(e);
}
//超过最大上传限制时回调
function onSizeError(e){
        console.log(e);
}
//选择文件时回调
function onSelect(e){
        console.log(e);
}
//开始上传或者打开文件时回调
function onOpen(e){
        console.log(e);
}
//上伟结束时,网页端返回内容时回调,一般会在onComplete事件后发生
function onUploadEnd(e){
        console.log(e);
}
//取消上传
function cancel(){
        document.getElementById("uploader").cancel();
}

</script>
<body>
<div style="width:100%;height:100%">
<EMBED id="uploader" src="Uploader.swf?maxsize=300&logo=http://static.youku.com/v1.0.0752/index/img/youkulogo-s.png&url=http://localhost/up.php&field=xx" quality=high bgcolor="#cccccc" WIDTH="100%" HEIGHT="100%" NAME="Yourfilename" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
</div>
</body>
</html>

```