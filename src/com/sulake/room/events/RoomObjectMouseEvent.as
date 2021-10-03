package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1487:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1414:String = "ROE_MOUSE_ENTER";
      
      public static const const_398:String = "ROE_MOUSE_MOVE";
      
      public static const const_1509:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_197:String = "ROE_MOUSE_CLICK";
      
      public static const const_444:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2131:Boolean;
      
      private var var_2130:Boolean;
      
      private var var_2127:Boolean;
      
      private var var_2129:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_2127 = param4;
         var_2129 = param5;
         var_2131 = param6;
         var_2130 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2130;
      }
      
      public function get altKey() : Boolean
      {
         return var_2127;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2129;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2131;
      }
   }
}
