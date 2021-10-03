package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2130:Boolean = false;
      
      private var var_2127:Boolean = false;
      
      private var var_1853:String = "";
      
      private var _type:String = "";
      
      private var var_2131:Boolean = false;
      
      private var var_1982:Number = 0;
      
      private var var_2128:Number = 0;
      
      private var var_2132:Number = 0;
      
      private var var_2133:String = "";
      
      private var var_1985:Number = 0;
      
      private var var_2129:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2133 = param2;
         var_1853 = param3;
         var_2128 = param4;
         var_2132 = param5;
         var_1982 = param6;
         var_1985 = param7;
         var_2129 = param8;
         var_2127 = param9;
         var_2131 = param10;
         var_2130 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_2129;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_2130;
      }
      
      public function get localX() : Number
      {
         return var_1982;
      }
      
      public function get localY() : Number
      {
         return var_1985;
      }
      
      public function get canvasId() : String
      {
         return var_2133;
      }
      
      public function get altKey() : Boolean
      {
         return var_2127;
      }
      
      public function get spriteTag() : String
      {
         return var_1853;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2128;
      }
      
      public function get screenY() : Number
      {
         return var_2132;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_2131;
      }
   }
}
