package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_587:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_180:String;
      
      private var var_632:String;
      
      private var var_1393:String;
      
      private var var_138:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_138 = param2;
         var_1393 = param3;
         var_180 = param4;
         var_632 = param5;
         _controller = param6;
      }
      
      public function get objectType() : String
      {
         return var_1393;
      }
      
      public function get colorHex() : String
      {
         return var_632;
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
