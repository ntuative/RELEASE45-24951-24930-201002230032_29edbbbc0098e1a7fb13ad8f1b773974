package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1644:int;
      
      private var var_2177:int = 0;
      
      private var var_2176:String;
      
      private var var_2178:int;
      
      private var var_2179:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1644 = param1;
         var_2178 = param2;
         var_2179 = param3;
         var_2176 = param4;
      }
      
      public function get length() : int
      {
         return var_2178;
      }
      
      public function get name() : String
      {
         return var_2179;
      }
      
      public function get creator() : String
      {
         return var_2176;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2177;
      }
      
      public function get id() : int
      {
         return var_1644;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2177 = param1;
      }
   }
}
