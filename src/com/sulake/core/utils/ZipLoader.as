package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_384:FZip;
      
      private var var_1166:Array;
      
      private var var_1862:uint = 0;
      
      private var var_792:int = 0;
      
      private var var_2336:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1166 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1166;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_12.content);
         var_1166.push(var_12.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_792;
         if(var_1166.length == var_1862)
         {
            var_12.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_12.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_12.loadBytes(var_384.getFileAt(var_792).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_298 = param1;
         if(var_384)
         {
            var_384.close();
         }
         var_384 = new FZip();
         var_384.addEventListener(Event.COMPLETE,onComplete);
         var_384.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_384.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_384.load(var_298);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_792 = 0;
         var_1862 = var_384.getFileCount();
         removeEventListeners();
         var_12.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_12.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_12.loadBytes(var_384.getFileAt(var_792).content);
      }
   }
}
