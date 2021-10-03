package com.sulake.habbo.room.events
{
   public class RoomEngineDimmerStateEvent extends RoomEngineEvent
   {
      
      public static const DIMMER_STATE:String = "REDSE_ROOM_COLOR";
       
      
      private var var_925:int;
      
      private var _color:uint;
      
      private var var_924:int;
      
      private var var_1614:int;
      
      private var var_31:int;
      
      public function RoomEngineDimmerStateEvent(param1:int, param2:int, param3:int, param4:int, param5:int, param6:uint, param7:uint, param8:Boolean = false, param9:Boolean = false)
      {
         super(DIMMER_STATE,param1,param2,param8,param9);
         var_31 = param3;
         var_1614 = param4;
         var_925 = param5;
         _color = param6;
         var_924 = param7;
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
