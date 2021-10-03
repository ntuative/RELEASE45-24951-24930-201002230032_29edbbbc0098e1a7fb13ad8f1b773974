package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   public class BinaryFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_12:URLLoader;
      
      protected var var_891:String;
      
      protected var _type:String;
      
      public function BinaryFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_891 = param2 == null ? "" : param2.url;
         _type = param1;
         var_12 = new URLLoader();
         var_12.addEventListener(Event.COMPLETE,loadEventHandler);
         var_12.addEventListener(Event.UNLOAD,loadEventHandler);
         var_12.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_12.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_12.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_12.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_12.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_891 = param1.url;
         var_12.dataFormat = _type == "application/octet-stream" ? "null" : URLLoaderDataFormat.TEXT;
         var_12.load(param1);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_12.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_12.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_12.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_12.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_12.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_12.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_12.close();
            var_12 = null;
            _type = null;
            var_891 = null;
         }
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get url() : String
      {
         return var_891;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_12.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_12.data;
      }
   }
}
