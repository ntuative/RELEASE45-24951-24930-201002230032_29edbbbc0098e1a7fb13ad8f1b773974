package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1903:int;
      
      private var var_1182:PetData;
      
      private var var_1904:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1903;
      }
      
      public function get petData() : PetData
      {
         return var_1182;
      }
      
      public function flush() : Boolean
      {
         var_1182 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1904;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1903 = param1.readInteger();
         var_1904 = param1.readInteger();
         var_1182 = new PetData(param1);
         return true;
      }
   }
}
