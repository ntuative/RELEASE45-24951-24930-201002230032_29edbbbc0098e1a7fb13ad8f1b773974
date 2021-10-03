package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_545:String;
      
      private var var_1620:int;
      
      private var var_2180:String;
      
      private var var_965:int;
      
      private var var_1183:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1183;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1183 = param1.readInteger();
         var_2180 = param1.readString();
         var_1620 = param1.readInteger();
         var_545 = param1.readString();
         var_965 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2180;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_545;
      }
      
      public function get petType() : int
      {
         return var_965;
      }
      
      public function get level() : int
      {
         return var_1620;
      }
   }
}
