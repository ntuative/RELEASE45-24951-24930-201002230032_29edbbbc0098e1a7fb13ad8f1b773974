package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_424:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_419:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_60:String = "RWPDUE_CONTENTS";
      
      public static const const_335:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_357:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_40:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_180:String;
      
      private var var_2046:BitmapData;
      
      private var var_138:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_138 = param2;
         var_180 = param3;
         _controller = param4;
         var_2046 = param5;
      }
      
      public function get method_5() : BitmapData
      {
         return var_2046;
      }
      
      public function get text() : String
      {
         return var_180;
      }
      
      public function get objectId() : int
      {
         return var_138;
      }
      
      public function get controller() : Boolean
      {
         return _controller;
      }
   }
}
