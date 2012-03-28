package com.ledui{
	import flash.net.FileFilter;
	import flash.net.URLRequest;
	import flash.events.*;
	import flash.net.FileReference;
	public class file{
		private var _fileRef:FileReference;
		private var _url:String;
		private var _field:String;
		private var _maxsize:Number=10;
		public function file(url:String,field:String="file"){
			_url = url;
			_field= field;
			_fileRef = new FileReference;
			_fileRef.addEventListener(Event.CANCEL, onCancel);
			_fileRef.addEventListener(Event.COMPLETE, onComplete);
			_fileRef.addEventListener(Event.SELECT, onSelect);
			_fileRef.addEventListener(Event.OPEN, onOpen);
			_fileRef.addEventListener(ProgressEvent.PROGRESS, onProgress);

			_fileRef.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onError);
			_fileRef.addEventListener(IOErrorEvent.IO_ERROR, onError);

			_fileRef.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, onUploadEnd);
		}
		public function setMaxSize(maxsize:Number):void{
			_maxsize = maxsize;
		}
		/*文件选择*/
		public function select():void{
			_fileRef.browse(getFilterTypes());
		}
		private function onCancel(evt:Event):void{
			js.call("onCancel",evt);
		}
		private function onComplete(evt:Event):void{
			js.call("onComplete",evt);
		}
		private function onError(evt:Event):void{
			js.call("onError",evt);
		}
		private function onProgress(evt:ProgressEvent):void {
			js.call("onProgress",evt);
		}
		private function onOpen(evt:Event):void {
			js.call("onOpen",evt);
		}
		private function onSelect(evt:Event):void {
			js.call("onSelect",evt);
			if(_fileRef.size>_maxsize*1024*1024){
				js.call("onSizeError",evt);
			}else{
				_fileRef.upload(new URLRequest(_url),_field);
			}
		}
		private function onUploadEnd(evt:DataEvent):void {
			js.call("onUploadEnd",evt);
		}
		private function getImageFilter():FileFilter {
			return new FileFilter("支持的图片类型(*.jpg;*.jpeg;*.gif;*.png)", "*.jpg;*.jpeg;*.gif;*.png");
		}
		private function getFilterTypes():Array {
			return [
				getImageFilter(),
				new FileFilter("GIF 文件 (*.gif)", "*.gif"),
				new FileFilter("PNG 文件 (*.png)", "*.png"),
				new FileFilter("JPG 文件 (*.jpg)", "*.jpg;*.jpeg")
					];
		}
	}
}
