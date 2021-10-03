package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const DIMMER_STATE:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_925:int;
      
      private var _color:uint;
      
      private var var_924:int;
      
      private var var_1614:int;
      
      private var var_31:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(DIMMER_STATE,param6,param7);
         var_31 = param1;
         var_1614 = param2;
         var_925 = param3;
         _color = param4;
         var_924 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_924;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_925;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function get method_1() : int
      {
         return var_1614;
      }
   }
}
