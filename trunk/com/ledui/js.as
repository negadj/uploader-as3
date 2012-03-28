package com.ledui{
	import flash.external.ExternalInterface;
	public class js{
		public static function call(func:*,msg:*=null):*{
			return ExternalInterface.call(func,msg);
		}
		public static function callback(func:*,callback:*):*{
			return ExternalInterface.addCallback(func,callback);
		}
		public static function log(msg:*):void{
			call("log",msg);
		}
	}
}
