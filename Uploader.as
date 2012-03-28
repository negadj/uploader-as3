package  
{
	import flash.display.Sprite;
	import flash.system.Security;
	import flash.display.Loader;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.StageScaleMode;
	import flash.events.*;
	import flash.net.URLRequest;
	import com.ledui.*;
	public class Uploader extends Sprite 
	{

		private var _file:file;
		private var _loader:Loader ;
		private var _mc:MovieClip;

		/**
		  @param field 上传文件的参数名,默认是file
		  @param maxsize 最大的上传文件大小,单位是M,默认10M
		  @param logo 上传的按钮图片
		  @param url 上传文件的接口地址 
	  	*/
		public function Uploader(){
			stage.align = flash.display.StageAlign.TOP_LEFT;  
			stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, whenResize);
			Security.allowDomain("*");

			var field:String = "file";
			if(stage.loaderInfo.parameters.field){
				field=stage.loaderInfo.parameters.field;
			}
			var _url:String="upload.php";
			if(stage.loaderInfo.parameters.url){
				_url=stage.loaderInfo.parameters.url;
			}
			var _logo:String="logo.gif";
			if(stage.loaderInfo.parameters.logo){
				_logo=stage.loaderInfo.parameters.logo;
			}

			_file = new file(_url,field);
			if(stage.loaderInfo.parameters.maxsize){
				_file.setMaxSize(stage.loaderInfo.parameters.maxsize);
			}
			_mc = new MovieClip();
			_mc.buttonMode = true;
			_mc.useHandCursor = true;
			_mc.addEventListener(MouseEvent.CLICK,onClick);
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			var request:URLRequest = new URLRequest(_logo);
			_loader.load(request);
			addChild(_mc);
			_mc.addChild(_loader);
		}
		private function onClick(evt:Event):void{
			_file.select();
		}
		private function completeHandler(e:Event):void{
			_mc.height=stage.stageHeight;
			_mc.width=stage.stageWidth;
		}
		private function whenResize(e:Event):void{  
			_mc.height=stage.stageHeight;
			_mc.width=stage.stageWidth;
		}
	}
}
