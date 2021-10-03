package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_867:String = "AssetLoaderEventUnload";
      
      public static const const_27:String = "AssetLoaderEventError";
      
      public static const const_976:String = "AssetLoaderEventOpen";
      
      public static const const_964:String = "AssetLoaderEventProgress";
      
      public static const const_769:String = "AssetLoaderEventStatus";
      
      public static const const_14:String = "AssetLoaderEventComplete";
       
      
      private var var_345:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_345 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_345;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_345);
      }
   }
}
