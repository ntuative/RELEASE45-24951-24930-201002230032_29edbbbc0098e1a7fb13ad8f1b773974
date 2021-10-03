package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_560:int = 2;
      
      public static const const_781:int = 6;
      
      public static const const_626:int = 1;
      
      public static const const_585:int = 3;
      
      public static const const_942:int = 4;
      
      public static const const_641:int = 5;
       
      
      private var var_1612:String;
      
      private var var_1044:int;
      
      private var var_1613:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1044 = param2;
         var_1613 = param3;
         var_1612 = param4;
      }
      
      public function get time() : String
      {
         return var_1612;
      }
      
      public function get senderId() : int
      {
         return var_1044;
      }
      
      public function get messageText() : String
      {
         return var_1613;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
