package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_12:Loader;
      
      protected var var_891:String;
      
      protected var _type:String;
      
      protected var var_1064:LoaderContext;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_891 = param2 == null ? "" : param2.url;
         _type = param1;
         var_12 = new Loader();
         var_1064 = new LoaderContext();
         var_1064.checkPolicyFile = true;
         var_12.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_12.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_12.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_12.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_12.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_12.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            var_12.load(param2,var_1064);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_12.contentLoaderInfo.bytesTotal;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_891 = param1.url;
         var_12.load(param1,var_1064);
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_12.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_12.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_12.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_12.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_12.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_12.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_12.close();
            }
            catch(e:*)
            {
            }
            var_12.unload();
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
         return var_12.contentLoaderInfo.bytesLoaded;
      }
      
      public function get content() : Object
      {
         return var_12.content;
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_1064;
      }
   }
}
