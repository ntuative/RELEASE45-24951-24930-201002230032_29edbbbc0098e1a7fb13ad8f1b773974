package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_75:Number = 0;
      
      private var var_203:int = 0;
      
      private var var_1611:int = 0;
      
      private var var_1950:Number = 0;
      
      private var var_1951:Number = 0;
      
      private var var_1948:Number = 0;
      
      private var var_1952:Number = 0;
      
      private var var_1949:Boolean = false;
      
      private var var_74:Number = 0;
      
      private var _id:int = 0;
      
      private var var_186:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_186 = [];
         super();
         _id = param1;
         var_74 = param2;
         _y = param3;
         var_75 = param4;
         var_1952 = param5;
         var_203 = param6;
         var_1611 = param7;
         var_1950 = param8;
         var_1951 = param9;
         var_1948 = param10;
         var_1949 = param11;
         var_186 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_75;
      }
      
      public function get dir() : int
      {
         return var_203;
      }
      
      public function get localZ() : Number
      {
         return var_1952;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1949;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1611;
      }
      
      public function get targetX() : Number
      {
         return var_1950;
      }
      
      public function get targetY() : Number
      {
         return var_1951;
      }
      
      public function get targetZ() : Number
      {
         return var_1948;
      }
      
      public function get x() : Number
      {
         return var_74;
      }
      
      public function get actions() : Array
      {
         return var_186.slice();
      }
   }
}
